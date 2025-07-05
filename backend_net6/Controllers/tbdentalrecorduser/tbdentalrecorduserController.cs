using backend_net6.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend_net6.Controllers;

[ApiController]
[Route("api/[controller]")]
[Produces("application/json")]
public class tbdentalrecorduserController : ControllerBase
{
    private readonly ILogger<tbdentalrecorduserController> _logger;
    private readonly Database _db;

    public tbdentalrecorduserController(ILogger<tbdentalrecorduserController> logger, Database db)
    {
        _logger = logger;
        _db = db;
    }

    /// <summary>
    /// ADMIN
    /// </summary>
    /// <returns>Create a tbdentalrecorduser</returns>
    /// <response code="201">Created a tbdentaluser successfully.</response>
    /// <response code="400">licesnse cannot exceed 10 characters., fName is required., fName cannot exceed 50 characters., lName cannot exceed 50 characters., roleID cannot be null., status cannot be null., users cannot be null., users cannot exceed 50 characters., passw cannot be null., tName cannot exceed 45 characters., type cannot exceed 10 characters., clinicid cannot exceed 255 characters.</response>
    /// <response code="500">Internal Server Error.</response>
    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> PostTbdentalrecorduser([FromBody] tbdentalrecorduserModel user)
    {
        _logger.LogDebug("POST /api/tbdentalrecorduser");
        if (user == null) return BadRequest("User data should not be null.");

        // ตรวจสอบ require field จาก model
        if (!ModelState.IsValid) return BadRequest(ModelState);

        try
        {

            user.Passw = PasswordHasher.HashMd5(user.Passw);
            _logger.LogDebug("Password hashed successfully.");

            _db.Tbdentalrecordusers.Add(user);
            await _db.SaveChangesAsync();

            return StatusCode(201, "Created a tbdentalrecorduser successfully.");

        }
        catch (Exception e)
        {
            _logger.LogError(e, "Error creatnig a tbdentalrecorduser.");
            return StatusCode(500, $"Internal Server Error: {e.Message}");
        }
    }

    /// <summary>
    /// ADMIN
    /// </summary>
    /// <returns>Fetch tbdentalrecordusers</returns>
    /// <response code="200">Tbdentalrecorduser lists</response>
    /// <response code="404">No tbdentalrecorduser data.</response>
    /// <response code="500">Internal Server Error.</response>
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<tbdentalrecorduserDto>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<ActionResult> GetTbdentalrecordusers()
    {
        _logger.LogDebug("GET /api/tbdentalrecord");
        try
        {
            var users = await _db.Tbdentalrecordusers
                .Select(user => new tbdentalrecorduserDto
                {
                    UserId = user.UserId,
                    Fname = user.Fname,
                    Lname = user.Lname,
                    License = user.License,
                    RoleID = user.RoleID,
                    Clinicid = user.Clinicid,
                }).ToListAsync();

            if (users == null || !users.Any()) return NotFound("No tbdentalrecorduser data.");

            return Ok(users);
        }
        catch (Exception e)
        {
            _logger.LogError(e, "Error fetching tbdentalrecorduser lists");
            return StatusCode(500, $"Internal Server Error: {e.Message}");
        }
    }

    /// <summary>
    /// ADMIN
    /// </summary>
    /// <returns>Fetch a tbdentalrecorduser</returns>
    /// <response code="200">Tbdentalrecorduser's info</response>
    /// <response code="404">Tbdentalrecorduser not found.</response>
    /// <response code="500">Internal Server Error.</response>
    [HttpGet("{userId:int}")]
    [ProducesResponseType(typeof(tbdentalrecorduserDto), StatusCodes.Status200OK)] // เปลี่ยน Type เป็น DTO
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<ActionResult<tbdentalrecorduserModel>> GetTbdentalrecorduser([FromRoute] int userId)
    {
        _logger.LogDebug("GET /api/tbdentalrecorduser/:userId");
        try
        {
            var user = await _db.Tbdentalrecordusers
                .FirstOrDefaultAsync(u => u.UserId == userId);

            if (user == null)
            {
                return NotFound($"Tbdentalrecorduser not found.");
            }

            return Ok(user);
        }
        catch (Exception e)
        {
            _logger.LogError(e, "Error fetching a tbdentalrecorduser with related data.");
            return StatusCode(500, $"Internal Server Error: {e.Message}");
        }
    }
    /// <summary>
    /// ADMIN
    /// </summary>
    /// <returns>Delete a tbdentalrecorduser</returns>
    /// <response code="404">Tbdentalrecorduser not found.</response>
    /// <response code="500">Internal Server Error.</response>
    [HttpDelete("{userId:int}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> DeleteTbdentalrecorduser([FromRoute] int userId)
    {
        _logger.LogDebug("DELETE /api/tbdentalrecorduser/:userId}");
        try
        {
            var user = await _db.Tbdentalrecordusers.FindAsync(userId);

            if (user == null) return NotFound("Tbdentalrecorduser not found.");

            _db.Tbdentalrecordusers.Remove(user);
            await _db.SaveChangesAsync();

            return NoContent();

        }
        catch (Exception e)
        {
            _logger.LogError(e, "Error deleting a tbdentalrecorduser.");
            return StatusCode(500, $"Internal Server Error: {e.Message}");
        }
    }

    /// <summary>
    /// ADMIN
    /// </summary>
    /// <returns>Patch a tbdentalrecorduser</returns>
    /// <response code="200">Tbdentalrecorduser updated successfully.</response>
    /// <response code="404">Tbdentalrecorduser not found.</response>
    /// <response code="500">Internal Server Error.</response>
    [HttpPatch("{userId:int}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> PatchTbdentalrecorduser([FromRoute] int userId, tbdentalrecorduserPatchDto patchDto)
    {
        _logger.LogDebug("PATCH /api/tbdentalrecorduser/:userId");
        try
        {
            var user = await _db.Tbdentalrecordusers.FindAsync(userId);
            if (user == null) return NotFound("Tbdentalrecorduser not found.");

            // Update only fields that are not null in patchDto
            if (patchDto.License != null) user.License = patchDto.License;
            if (patchDto.Fname != null) user.Fname = patchDto.Fname;
            if (patchDto.Lname != null) user.Lname = patchDto.Lname;
            if (patchDto.RoleID.HasValue) user.RoleID = patchDto.RoleID.Value;
            if (patchDto.Status.HasValue) user.Status = patchDto.Status.Value;
            if (patchDto.Users != null) user.Users = patchDto.Users;
            if (patchDto.Passw != null) user.Passw = PasswordHasher.HashMd5(patchDto.Passw);
            if (patchDto.Tname != null) user.Tname = patchDto.Tname;
            if (patchDto.Sort.HasValue) user.Sort = patchDto.Sort.Value;
            if (patchDto.Type != null) user.Type = patchDto.Type;
            if (patchDto.Clinicid != null) user.Clinicid = patchDto.Clinicid;

            await _db.SaveChangesAsync();

            return Ok("Tbdentalrecorduser updated successfully.");
        }
        catch (Exception e)
        {
            _logger.LogError(e, "Error patching a tbdentalrecorduser.");
            return StatusCode(500, $"Internal Server Error: {e.Message}");
        }
    }
}