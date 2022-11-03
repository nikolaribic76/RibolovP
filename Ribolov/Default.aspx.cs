using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

namespace Ribolov
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using(SqlConnection conn = new SqlConnection(Connection.conString))
            {
                conn.Open();
                string insert = "INSERT INTO Ribolovac VALUES(@Ime, @Prezime, @Adresa, @Telefon, @GradID)";

                using(SqlCommand cmd = new SqlCommand(insert, conn))
                {
                    cmd.Parameters.AddWithValue("@Ime", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Prezime", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@Adresa", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Telefon", TextBox4.Text);
                    int grad = 0;
                    switch (TextBox5.Text)
                    {
                        case "Novi Sad":
                            grad = 1;
                            break;
                        case "Beograd":
                            grad = 2;
                            break;
                        case "Kragujevac":
                            grad = 3;
                            break;
                    }

                    cmd.Parameters.AddWithValue("@GradID", grad);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
    }
}