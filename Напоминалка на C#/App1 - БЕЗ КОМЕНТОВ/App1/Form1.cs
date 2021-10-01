using System; 
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Win32;
using App1.Properties;
using System.Reflection;

namespace App1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true) 
            {
                SetAutoRunValue(true, Assembly.GetExecutingAssembly().Location);
            }
            else 
            {
                SetAutoRunValue(false, Assembly.GetExecutingAssembly().Location);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            label3.Text = "Вы выбрали: " + dateTimePicker1.Value.Date.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dateTimePicker1.Value.Date < DateTime.Today) 
            {
                MessageBox.Show("Выберите дату не из прошлого! Мы не в фильме Назад в прошлое "); 
            }
            else if (label3.Text != "  ") 
            {
                Settings.Default["Date_chosen"] = dateTimePicker1.Value.Date;
                Settings.Default.Save(); 
                MessageBox.Show("Данные сохранены!");
            }
            else
            {
                MessageBox.Show("Выберите дату!"); 
            }
        }

        
        private bool SetAutoRunValue(bool autorun, string path)
        {
            const string name = "app1"; 
            string ExePath = path; 
            RegistryKey reg; 
            reg = Registry.CurrentUser.CreateSubKey("Software\\Microsoft\\Windows\\CurrentVersion\\Run\\");
            try
            {
                if (autorun) 
                {
                    reg.SetValue(name, ExePath);
                }
                else 
                {
                    reg.DeleteValue(name);
                }

                reg.Flush();
                reg.Close();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}
