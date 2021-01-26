using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Projeto
{
    public partial class LogIn : Form
    {
        private SqlConnection cn;

        public LogIn()
        {
            cn = getSGBDConnection();
            InitializeComponent();
        }

        //sair botão
        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // login botton
        private void button2_Click(object sender, EventArgs e)
        {
            // vai buscar os usernames e a password à db
            string querylogin = "SELECT * FROM Projeto.Table_LogIn WHERE username = '" + username.Text.Trim() + "' and password = '" + password.Text.Trim() + "'";
            SqlDataAdapter sda = new SqlDataAdapter(querylogin, cn);
            DataTable dtblogin = new DataTable();
            sda.Fill(dtblogin);
            // se os dados são iguais à data base então mostra o main
            if(dtblogin.Rows.Count == 1)
            {
                MainPage mainpage = new MainPage();
                this.Hide();
                mainpage.Show();
            }
            //dados forem diferentes
            else
            {
                MessageBox.Show("Username ou Password errados");
            }
        }
        // username textbox
        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Projeto;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void LogIn_Load(object sender, EventArgs e)
        {

        }
    }
}
