using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend_net6.Models
{
    public class tbdentalrecorduserModel
    {
        [Key]
        [Column("userId")]
        public int UserId { get; set; }

        [Column("license")]
        [StringLength(10, ErrorMessage = "license cannot exceed 10 characters.")]
        public string? License { get; set; }

        [Column("fName")]
        [Required(ErrorMessage = "fName is required.")]
        [StringLength(50, ErrorMessage = "fName cannot exceed 50 characters.")]
        public string Fname { get; set; } = string.Empty;

        [Column("lName")]
        [StringLength(50, ErrorMessage = "lName cannot exceed 50 characters.")]
        public string? Lname { get; set; }

        [Column("roleID")]
        [Required(ErrorMessage = "roleID cannot be null.")]
        public int RoleID { get; set; }


        [Column("status")]
        [Required(ErrorMessage = "status cannot be null.")]
        public int Status { get; set; }

        [Column("users")]
        [Required(ErrorMessage = "users cannot be null.")]
        [StringLength(50, ErrorMessage = "users cannot exceed 50 characters.")]
        public string Users { get; set; } = string.Empty;

        [Column("passw")]
        [Required(ErrorMessage = "passw cannot be null.")]
        [StringLength(32, ErrorMessage = "passw cannot exceed 32 characters.")]
        public string Passw { get; set; } = string.Empty;

        [Column("tName")]
        [StringLength(45, ErrorMessage = "tName cannot exceed 45 characters.")]
        public string? Tname { get; set; }

        [Column("sort")]
        [Range(0, 3)]
        public decimal? Sort { get; set; }

        [Column("type")]
        [StringLength(10, ErrorMessage = "type cannot exceed 10 characters.")]
        public string? Type { get; set; }

        [Column("clinicid")]
        public string? Clinicid { get; set; }
    }

    public class tbdentalrecorduserDto
    {
        [Key]
        [Column("userId")]
        public int UserId { get; set; }

        [Column("license")]
        [StringLength(10, ErrorMessage = "license cannot exceed 10 characters.")]
        public string? License { get; set; }

        [Column("fName")]
        [Required(ErrorMessage = "fName is required.")]
        [StringLength(50, ErrorMessage = "fName cannot exceed 50 characters.")]
        public string Fname { get; set; } = string.Empty;

        [Column("lName")]
        [StringLength(50, ErrorMessage = "lName cannot exceed 50 characters.")]
        public string? Lname { get; set; }

        [Column("roleID")]
        [Required(ErrorMessage = "roleID cannot be null.")]
        [Range(1, 12, ErrorMessage = "RoleID must be between 1 and 12.")]
        public int RoleID { get; set; }

        [Column("tName")]
        [StringLength(45, ErrorMessage = "tName cannot exceed 45 characters.")]
        public string? Tname { get; set; }

        [Column("clinicid")]
        public string? Clinicid { get; set; }
    }

    public class tbdentalrecorduserPatchDto
    {
        [StringLength(10, ErrorMessage = "license cannot exceed 10 characters.")]
        public string? License { get; set; }

        [StringLength(50, ErrorMessage = "fName cannot exceed 50 characters.")]
        public string? Fname { get; set; }

        [StringLength(50, ErrorMessage = "lName cannot exceed 50 characters.")]
        public string? Lname { get; set; }

        [Range(1, 12, ErrorMessage = "RoleID must be between 1 and 12.")]
        public int? RoleID { get; set; }

        [Range(0, 1, ErrorMessage = "Status must be 0 or 1.")]
        public int? Status { get; set; }

        [StringLength(50, ErrorMessage = "users cannot exceed 50 characters.")]
        public string? Users { get; set; }

        [StringLength(255, ErrorMessage = "passw cannot exceed 255 characters.")]
        public string? Passw { get; set; }

        [StringLength(45, ErrorMessage = "tName cannot exceed 45 characters.")]
        public string? Tname { get; set; }

        [Range(0, 3, ErrorMessage = "Sort must be between 0 and 3.")]
        public decimal? Sort { get; set; }

        [StringLength(10, ErrorMessage = "type cannot exceed 10 characters.")]
        public string? Type { get; set; }

        public string? Clinicid { get; set; }
    }
}