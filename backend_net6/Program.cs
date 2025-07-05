using Microsoft.EntityFrameworkCore;
using DotNetEnv;
using Microsoft.OpenApi.Models;
using System.Reflection;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Security.Claims;
using backend_net6.Services;

Env.Load();

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddDbContext<Database>(options =>
{
    var connectionString = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING")
                          ?? builder.Configuration.GetConnectionString("DefaultConnection");

    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

// JWT Configuration
var jwtSecret = Environment.GetEnvironmentVariable("JWT_SECRET");
var jwtIssuer = Environment.GetEnvironmentVariable("JWT_ISSUER");
var jwtAudience = Environment.GetEnvironmentVariable("JWT_AUDIENCE");
var jwtExpireMinutes = int.Parse(Environment.GetEnvironmentVariable("JWT_TOKEN_EXPIRE_MINUTES") ?? "60");

Console.WriteLine($"DEBUG: Raw JWT_SECRET: '{jwtSecret}'"); // แสดงค่าทั้งหมด
Console.WriteLine($"DEBUG: Is JWT_SECRET null or empty? {string.IsNullOrEmpty(jwtSecret)}");
Console.WriteLine($"DEBUG: Raw JWT_ISSUER: '{jwtIssuer}'");
Console.WriteLine($"DEBUG: Is JWT_ISSUER null or empty? {string.IsNullOrEmpty(jwtIssuer)}");
Console.WriteLine($"DEBUG: Raw JWT_AUDIENCE: '{jwtAudience}'");
Console.WriteLine($"DEBUG: Is JWT_AUDIENCE null or empty? {string.IsNullOrEmpty(jwtAudience)}");
Console.WriteLine($"DEBUG: JWT_TOKEN_EXPIRE_MINUTES: {jwtExpireMinutes}");

if (string.IsNullOrEmpty(jwtSecret) || string.IsNullOrEmpty(jwtIssuer) || string.IsNullOrEmpty(jwtAudience))
{
    throw new InvalidOperationException("JWT_SECRET, JWT_ISSUER, and JWT_AUDIENCE must be set in .env file.");
}

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtIssuer,
        ValidAudience = jwtAudience,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSecret)),
        ClockSkew = TimeSpan.Zero // เพื่อไม่ให้ token หมดอายุก่อนเวลาจริง
    };
});

builder.Services.AddScoped<IJwtTokenGenerator, JwtTokenGenerator>();

builder.Services.AddAuthorization(options =>
{
    // ตัวอย่างการสร้าง Policy สำหรับ Role (ถ้าคุณมี Role Based Authorization)
    options.AddPolicy("AdminOnly", policy => policy.RequireClaim(ClaimTypes.Role, "Administrator"));
    options.AddPolicy("AppointmentOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ระบบนัดหมาย"));
    options.AddPolicy("FinancialOnly", policy => policy.RequireClaim(ClaimTypes.Role, "การเงิน"));
    options.AddPolicy("MedicalrecordOnly", policy => policy.RequireClaim(ClaimTypes.Role, "เวชระเบียน"));
    options.AddPolicy("TeacherOnly", policy => policy.RequireClaim(ClaimTypes.Role, "อาจารย์"));
    options.AddPolicy("BachelorOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ปริญญาตรี"));
    options.AddPolicy("DrugOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ระบบยา"));
    options.AddPolicy("GeneralOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ผู้ใช้งานทั่วไป"));
    options.AddPolicy("MasterOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ปริญญาโท"));
    options.AddPolicy("RequirementDiagOnly", policy => policy.RequireClaim(ClaimTypes.Role, "RequirementDiag"));
    options.AddPolicy("HeadAssistantDentistOnly", policy => policy.RequireClaim(ClaimTypes.Role, "หัวหน้าผู้ช่วยทันตแพทย์"));
    options.AddPolicy("AssistantDentistOnly", policy => policy.RequireClaim(ClaimTypes.Role, "ผู้ช่วยทันตแพทย์"));
});

// Add services to the container.
builder.Services.AddControllers().AddNewtonsoftJson();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "e-Chart's Dentistry Hospital",
        Version = "v1",
        Description = "API สำหรับโปรเจค e-Chart ระบบทันตกรรม",
    });

    var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    c.IncludeXmlComments(xmlPath);

    // Add JWT Authentication to Swagger
    var securityScheme = new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Description = "Enter JWT Bearer token **_only_**",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        Reference = new OpenApiReference
        {
            Id = JwtBearerDefaults.AuthenticationScheme,
            Type = ReferenceType.SecurityScheme
        }
    };
    c.AddSecurityDefinition(securityScheme.Reference.Id, securityScheme);
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {securityScheme, new string[] { }}
    });
});

var app = builder.Build();

// ตรวจสอบการเชื่อมต่อฐานข้อมูล
using (var scope = app.Services.CreateScope())
{
    var context = scope.ServiceProvider.GetRequiredService<Database>();
    try
    {
        await context.Database.EnsureCreatedAsync();
        Console.WriteLine("✅ เชื่อมต่อกับฐานข้อมูล MySQL สำเร็จ!");
        Console.WriteLine($"📊 ฐานข้อมูล: {context.Database.GetDbConnection().Database}");
        Console.WriteLine($"🔗 Server: {context.Database.GetDbConnection().DataSource}");
    }
    catch (Exception ex)
    {
        Console.WriteLine("❌ ไม่สามารถเชื่อมต่อฐานข้อมูลได้:");
        Console.WriteLine($"🔴 Error: {ex.Message}");
        Console.WriteLine("🔧 กรุณาตรวจสอบ connection string และการตั้งค่า MySQL");
    }
}

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
