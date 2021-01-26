using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto
{
    public partial class EncomendasMP : Form
    {
        public EncomendasMP()
        {
            InitializeComponent();
        }

        //back button
        private void button1_Click(object sender, EventArgs e)
        {
            MainPage mainpage = new MainPage();
            this.Hide();
            mainpage.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {

        }
    }
}
