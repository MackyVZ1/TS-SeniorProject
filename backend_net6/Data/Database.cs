using backend_net6.Models;
using Microsoft.EntityFrameworkCore;

public class Database : DbContext
{
    public Database(DbContextOptions<Database> options) : base(options) { }

    public DbSet<tbdentalrecorduserModel> Tbdentalrecordusers { get; set; } = null!;
    public DbSet<tbroleModel> Tbroles { get; set; } = null!;
    public DbSet<tbclinicModel> Tbclinics { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<tbdentalrecorduserModel>().ToTable("tbdentalrecorduser");
        modelBuilder.Entity<tbroleModel>().ToTable("tbrole");
        modelBuilder.Entity<tbclinicModel>().ToTable("tbclinic");
        base.OnModelCreating(modelBuilder);
    }
}