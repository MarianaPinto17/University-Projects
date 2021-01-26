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
    public partial class EncomendarMP : Form
    {
        public EncomendarMP()
        {
            InitializeComponent();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Matéria Prima encomendada, se quiser adicionar mais Matéria Prima à encomenda, prossiga. Caso contrário, clique em finalizar encomenda.");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Encomenda realizada com sucesso.");
        }
    }
}
