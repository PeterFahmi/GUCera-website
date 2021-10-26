﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class AllCourses : System.Web.UI.Page
    {
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            else
            {
                if (!Session["userType"].ToString().Equals("admin"))
                {
                    Response.Redirect("NotAccessiblePage.aspx");
                }
                fname.Text = Session["fname"].ToString();
            }
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection con = new SqlConnection(connStr);

            SqlCommand courses = new SqlCommand("AdminViewAllCourses", con);
            courses.CommandType = CommandType.StoredProcedure;
            TextBox a = new TextBox();
            a.Text = "Name";
            a.ReadOnly = true;
            TextBox b = new TextBox();
            b.Text = "CreditHours";
            b.ReadOnly = true;
            TextBox c = new TextBox();
            c.Text = "Price";
            c.ReadOnly = true;
            TextBox d = new TextBox();
            d.Text = "Content";
            d.ReadOnly = true;
            TextBox f = new TextBox();
            f.Text = "Accepted";
            f.ReadOnly = true;
            upperDiv.Controls.Add(a);
            upperDiv.Controls.Add(b);
            upperDiv.Controls.Add(c);
            upperDiv.Controls.Add(d);
            upperDiv.Controls.Add(f);
            upperDiv.Controls.Add(new Literal() { Text = "<br>" });
            con.Open();
            SqlDataReader rdr = courses.ExecuteReader(CommandBehavior.CloseConnection);
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    Panel coursePanel = new Panel();
                    string cname = rdr.GetString(rdr.GetOrdinal("name"));
                    TextBox l = new TextBox();
                    l.Text = cname;
                    l.ReadOnly = true;
                    int ccredit = (int)rdr.GetValue(1);
                    TextBox k = new TextBox();
                    k.Text = ccredit + "";
                    k.ReadOnly = true;
                    Decimal cprice = (Decimal)rdr.GetValue(2);
                    TextBox m = new TextBox();
                    m.Text = cprice + "";
                    m.ReadOnly = true;
                    TextBox n = new TextBox();
                    try
                    {
                        string ccontent = (string)rdr.GetValue(3);
                        n.Text = ccontent;
                    }
                    catch
                    {
                        n.Text = "NULL";
                    }
                    n.ReadOnly = true;
                    TextBox s = new TextBox();
                    try
                    {
                        Boolean caccepted = (Boolean)rdr.GetValue(4);
                        s.Text = caccepted + "";
                    }
                    catch
                    {
                        s.Text = "NULL";
                    }
                    s.ReadOnly = true;
                   coursePanel.CssClass += "CourseContainer";
                    coursePanel.Controls.Add(l);
                    coursePanel.Controls.Add(k);
                    coursePanel.Controls.Add(m);
                    coursePanel.Controls.Add(n);
                    coursePanel.Controls.Add(s);
                    coursePanel.Controls.Add(new Literal() { Text = "<br>" });
                    baseDiv.Controls.Add(coursePanel);
                }


            }
            else
            {
                Label l = new Label();
                l.Text = "no courses available";
                msg.Controls.Add(l);

            }
        }
    }
}