//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MBAProfile.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Student_AcademicStatus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student_AcademicStatus()
        {
            HashSet<UCMStudent> hs = new HashSet<UCMStudent>();
            this.UCMStudents = new List<UCMStudent>(hs);
        }
    
        public int ID { get; set; }
        public string AcademicStatus { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual List<UCMStudent> UCMStudents { get; set; }
    }
}
