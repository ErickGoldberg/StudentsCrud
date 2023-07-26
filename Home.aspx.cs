using StudentsCrud.Data;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace StudentsCrud
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.HttpMethod == "GET")
                {
                    UpdateGridView();
                }
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string name = txtName.Value;
            double grade1 = Convert.ToDouble(txtGrade1.Value);
            double grade2 = Convert.ToDouble(txtGrade2.Value);

            List<Student> studentsList = GetStudentsListFromSession();
            Student newStudent = new Student
            {
                Name = name,
                Grade1 = grade1,
                Grade2 = grade2,
                Average = ((grade1 + grade2) / 2)
            };
            studentsList.Add(newStudent);

            UpdateGridView();

            Response.Redirect(Request.RawUrl);
        }

        private List<Student> GetStudentsListFromSession()
        {
            if (Session["StudentsList"] == null)
            {
                List<Student> studentsList = new List<Student>();
                Session["StudentsList"] = studentsList;
            }
            return (List<Student>)Session["StudentsList"];
        }

        private void UpdateGridView()
        {
            List<Student> studentsList = GetStudentsListFromSession();
            studentTable.DataSource = studentsList;
            studentTable.DataBind();
        }

        protected void studentTable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Ativa o modo de edição
            studentTable.EditIndex = e.NewEditIndex;
            UpdateGridView();
        }

        protected void studentTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Remove o aluno da lista com base no índice da linha excluída
            int index = e.RowIndex;
            List<Student> studentsList = GetStudentsListFromSession();
            studentsList.RemoveAt(index);
            UpdateGridView();
        }

    }
}
