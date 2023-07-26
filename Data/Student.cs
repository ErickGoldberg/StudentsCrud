using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentsCrud.Data
{
    public class Student
    {
        public string Name { get; set; }
        public double Grade1 { get; set; }
        public double Grade2 { get; set; }
        public double Average { get; internal set; }
    }
}