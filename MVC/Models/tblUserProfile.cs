//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NotesMarketPlace.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web;

    public partial class tblUserProfile
    {
        public int id { get; set; }
        [Required]
        public int userID { get; set; }
        public Nullable<System.DateTime> dob { get; set; }
        public string gender { get; set; }
        public string secondaryEmailID { get; set; }
        [Required]
        public string countryCode_phoneNo { get; set; }
        [Required]
        public string phoneNo { get; set; }
        public string profilePicture { get; set; }
        //[AllowFileSize(FileSize = 5 * 1024 * 1024, ErrorMessage = "Maximum allowed file size is 5 MB")]
        public HttpPostedFileBase profileImage { get; set; }
        public string addressLine1 { get; set; }
        public string addressLine2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zipcode { get; set; }
        public string country { get; set; }
        public string university { get; set; }
        public string college { get; set; }
        public Nullable<System.DateTime> createdDate { get; set; }
        public Nullable<int> createdBy { get; set; }
        public Nullable<System.DateTime> modifiedDate { get; set; }
        public Nullable<int> modifiedBy { get; set; }
        public bool isProfileSet { get; set; }

        public virtual tblUser tblUser { get; set; }
    }
}
