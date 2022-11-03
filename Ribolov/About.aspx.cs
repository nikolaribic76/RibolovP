using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Ribolov
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropDownList();
                FillDropDownListVrstaRibe();
            }
        }

        public void FillDropDownList()
        {
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add(new ListItem("Izaberite pecarosa:"));

            using (SqlConnection conn = new SqlConnection(Connection.conString))
            {
                conn.Open();
                string select = "SELECT * FROM Ribolovac";

                using(SqlCommand cmd = new SqlCommand(select, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Ime"].ToString() + " " + reader["Prezime"].ToString();
                        item.Value = reader["RibolovacID"].ToString();
                        DropDownList1.Items.Add(item);
                    }
                    reader.Close();
                }
            }
        }

        public void FillDropDownListVrstaRibe()
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem("Izaberite vrstu ribe:"));

            using (SqlConnection conn = new SqlConnection(Connection.conString))
            {
                conn.Open();
                string select = "SELECT * FROM Vrsta_ribe";

                using (SqlCommand cmd = new SqlCommand(select, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Naziv"].ToString();
                        item.Value = reader["VrstaID"].ToString();
                        DropDownList2.Items.Add(item);
                    }
                    reader.Close();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ne raditi u ovoj metodi*********************************************
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Connection.conString))
            {
                conn.Open();
                string select = "SELECT * FROM Ribolovac where RibolovacID = @id";

                using (SqlCommand cmd = new SqlCommand(select, conn))
                {
                    cmd.Parameters.AddWithValue("@id", DropDownList1.SelectedItem.Value);
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    TextBox1.Text = reader["RibolovacID"].ToString();
                    reader.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Connection.conString))
            {
                conn.Open();
                string select = "INSERT INTO Ulov VALUES(@RibolovacID, @DatumUlova, @VrstaID, @Gramaza)";

                using (SqlCommand cmd = new SqlCommand(select, conn))
                {
                    cmd.Parameters.AddWithValue("@RibolovacID", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@DatumUlova", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@VrstaID", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Gramaza", TextBox3.Text);


                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}