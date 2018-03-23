using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class Admin_addquestion : System.Web.UI.Page
{
    string quizdetailstable = "quizdetails";
    string quizquestionstable = "quiz_questions";
    string quizquestionoptionstable = "question_options";
    string quizquestionanswertable = "question_answer";
    string qstring = "0";
    string qtype = "";
    int quizId = 0;
    int tempval = 0;
    int qorder = 0;
    int questid = 0;
    int quizquestionid = 0;
    string imageFilename= "";
    string ImageFilePath = "";
    byte[] uploadedBytes = null;
    DateTime updatedate = new DateTime();

    protected void Page_Load(object sender, EventArgs e)
    {
        updatedate = DateTime.Now;
        HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
        HttpContext.Current.Response.AddHeader("Expires", "0");


        if (!Page.IsPostBack)
        {
            //get the query string value
            if (Page.Request["q"] == null)
            {
                addquestiondiv.InnerHtml = "<br /><span style='color:#FF0000; font-size:15px;'>Please select a quiz event first and try again.</span>";
            }
            else
            {
                qstring = Page.Request["q"].ToString();
                quizId = Convert.ToInt32(qstring);

                //strore the quiz id in hidden field
                quizfield.Value = qstring;
            }
        }
        else
        {
            if (int.TryParse(quizfield.Value, out tempval) == true)
            {
                quizId = tempval;
            }
            else
            {
                addquestiondiv.InnerHtml = "<br /><span style='color:#FF0000; font-size:15px;'>Please select a quiz event first and try again.</span>";
            }
        }

       //set the home link
        //HyperLink homelink = (HyperLink)Master.FindControl("homelnk");
        //if (homelink != null)
        //{
         //   homelink.NavigateUrl = "setquestions?q=" + quizId;
        //}

        //add javascript event
        multiplequestionsubmit.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + multiplequestionsubmit.ClientID + ".disabled=true; " + multiplequestionsubmit.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(multiplequestionsubmit, ""));
        multipleanswersubmit.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + multipleanswersubmit.ClientID + ".disabled=true; " + multipleanswersubmit.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(multipleanswersubmit, ""));
        singleoptionsubmit.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + singleoptionsubmit.ClientID + ".disabled=true; " + singleoptionsubmit.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(singleoptionsubmit, ""));
    }

    //load template based on question type
    protected void questiontypechanged(object sender, EventArgs e)
    {
        qtype = ddltype.SelectedItem.Text.ToLower();

        if (qtype == "multiple")
        {
            lblmessage.Visible = false;
            multipleoptiondiv.Visible = true;
            singleoptiondiv.Visible = false;
            FileUploadControl2.Visible = false;
            UploadButton2.Visible = false;
            Image3.Visible = false;
            StatusLabel2.Visible = false;
            ImageCheckBox1.Text = "Imagen";

        }
        else if (qtype == "single")
        {
            lblmessage.Visible = false;
            multipleoptiondiv.Visible = false;
            singleoptiondiv.Visible = true;
            FileUploadControl1.Visible = false;
            UploadButton1.Visible = false;
            Image2.Visible = false;
            StatusLabel1.Visible = false;
            ImageCheckBox.Text = "Imagen";

        }
        else
        {
            multipleoptiondiv.Visible = false;
            singleoptiondiv.Visible = false;
            lblmessage.Visible = true;
            lblmessage.Text = "Por favor seleccione un tipo de pregunta";
        }
    }


    //multiple answer question
    protected void multiplequestionsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (quizId > 0)
           // {

                Byte[] imagebytes;
                uploadedBytes = Page.Session["UploadedBytes"] as byte[];
                qorder = getquestionorder();
                qtype = ddltype.SelectedItem.Text.ToLower();
                string category = ddlCategorias1.SelectedItem.Text.Trim();

                string multipleoptionquestion = txtmultipleoption.Text.Trim();
                string option1str = txtmultipleoption1.Text.Trim();
                string option2str = txtmultipleoption2.Text.Trim();
                string option3str = txtmultipleoption3.Text.Trim();
                string option4str = txtmultipleoption4.Text.Trim();
                string option5str = txtmultipleoption5.Text.Trim();

                string singleoptionanswer = ddlmultipleanswer.SelectedItem.Value;

                string textoptionquestion = txtsingleoption.Text.Trim();
                string textoptionanswer = txtsingleoptionanswer.Text.Trim();
                string contenttype = "image/jpeg";


                if (ImageCheckBox1.Checked == true & uploadedBytes != null)
                {
                    imageFilename = Page.Session["ImageFilename"].ToString();
                    ImageFilePath = Page.Session["ImageFilePath"].ToString();
                    FileUploadControl2.PostedFile.SaveAs(Server.MapPath("~/") + imageFilename);

                    // Read the file and convert it to Byte Array
                    FileStream fs = new FileStream(ImageFilePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    imagebytes = br.ReadBytes((Int32)fs.Length);


                    SqlCommand insertnew = new SqlCommand("insert into " + quizquestionstable + " (quizid, questionorder, type, title, lastupdated, image_name, content_type, data, category) values (@quizid, @questionorder, @type, @title, @lastupdated, @image_name, @content_type, @data, @category)");
                    insertnew.Parameters.AddWithValue("quizid", quizId);
                    insertnew.Parameters.AddWithValue("questionorder", qorder);
                    insertnew.Parameters.AddWithValue("title", multipleoptionquestion);
                    insertnew.Parameters.AddWithValue("type", qtype);
                    insertnew.Parameters.AddWithValue("lastupdated", updatedate);
                    insertnew.Parameters.AddWithValue("image_name", imageFilename);
                    insertnew.Parameters.AddWithValue("content_type", contenttype);
                    insertnew.Parameters.AddWithValue("data", uploadedBytes);
                    insertnew.Parameters.AddWithValue("category", category);

                    db insertnewquestion = new db();
                    insertnewquestion.ExecuteQuery(insertnew);

                    quizquestionid = getquizquestionid();

                //if question created successfully
                if (quizquestionid > 0)
                {
                    //store the value in hidden field
                    questionfield.Value = quizquestionid.ToString();

                    //insert options
                    if (String.IsNullOrEmpty(option1str) == true && String.IsNullOrEmpty(option2str) == true && String.IsNullOrEmpty(option3str) == true && String.IsNullOrEmpty(option4str) == true)
                    {
                        lblmessage.Visible = true;
                        lblmessage.Text = "Por favor ingrese las respuestas";
                    }
                    else
                    {
                        //insert option1
                        SqlCommand insertquestionoption1cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                        insertquestionoption1cmd.Parameters.AddWithValue("questionid", quizquestionid);
                        insertquestionoption1cmd.Parameters.AddWithValue("questionoption", option1str);
                        insertquestionoption1cmd.Parameters.AddWithValue("lastupdated", updatedate);

                        db insertoption1 = new db();
                        insertoption1.ExecuteQuery(insertquestionoption1cmd);

                        //insert option2
                        SqlCommand insertquestionoption2cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                        insertquestionoption2cmd.Parameters.AddWithValue("questionid", quizquestionid);
                        insertquestionoption2cmd.Parameters.AddWithValue("questionoption", option2str);
                        insertquestionoption2cmd.Parameters.AddWithValue("lastupdated", updatedate);

                        db insertoption2 = new db();
                        insertoption2.ExecuteQuery(insertquestionoption2cmd);

                        //insert option3
                        if (String.IsNullOrEmpty(option3str) == false)
                        {
                            SqlCommand insertquestionoption3cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption3cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption3cmd.Parameters.AddWithValue("questionoption", option3str);
                            insertquestionoption3cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption3 = new db();
                            insertoption3.ExecuteQuery(insertquestionoption3cmd);
                        }

                        //insert option4
                        if (String.IsNullOrEmpty(option4str) == false)
                        {
                            SqlCommand insertquestionoption4cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption4cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption4cmd.Parameters.AddWithValue("questionoption", option4str);
                            insertquestionoption4cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption4 = new db();
                            insertoption4.ExecuteQuery(insertquestionoption4cmd);
                        }

                        //insert option5
                        if (String.IsNullOrEmpty(option5str) == false)
                        {
                            SqlCommand insertquestionoption5cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption5cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption5cmd.Parameters.AddWithValue("questionoption", option5str);
                            insertquestionoption5cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption5 = new db();
                            insertoption5.ExecuteQuery(insertquestionoption5cmd);
                        }
                    }

                    //insert answer
                    ddltype.Visible = false;
                    txtmultipleoption.ReadOnly = true;
                    txtmultipleoption1.ReadOnly = true;
                    txtmultipleoption2.ReadOnly = true;
                    txtmultipleoption3.ReadOnly = true;
                    txtmultipleoption4.ReadOnly = true;
                    txtmultipleoption5.ReadOnly = true;
                    txtmultipleoption.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption1.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption2.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption3.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption4.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption5.BackColor = System.Drawing.Color.LightBlue;
                    multiplequestionsubmit.Visible = false;
                    multipleanswersubmit.Visible = true;
                    lblanswer.Visible = true;
                    ddlmultipleanswer.Visible = true;


                    //get the available options
                    populateanswers(quizquestionid);
                }
                else
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "Sorry! we could not process your request. Please try again";
                }

            }

                else if (ImageCheckBox1.Checked == false & uploadedBytes == null)

                {
                    //insert the question
                    SqlCommand insertnewquestioncmd = new SqlCommand("insert into " + quizquestionstable + " (quizid, questionorder, title, type, lastupdated, category) values (@quizid, @questionorder, @title, @type, @lastupdated, @category);SELECT CAST(scope_identity() AS int)");
                    insertnewquestioncmd.Parameters.AddWithValue("quizid", quizId);
                    insertnewquestioncmd.Parameters.AddWithValue("questionorder", qorder);
                    insertnewquestioncmd.Parameters.AddWithValue("title", multipleoptionquestion);
                    insertnewquestioncmd.Parameters.AddWithValue("type", qtype);
                    insertnewquestioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                    insertnewquestioncmd.Parameters.AddWithValue("category", category);

                    db insertnewquestion = new db();
                    insertnewquestion.ExecuteQuery(insertnewquestioncmd);

                    quizquestionid = getquizquestionid();

                //if question created successfully
                if (quizquestionid > 0)
                {
                    //store the value in hidden field
                    questionfield.Value = quizquestionid.ToString();

                    //insert options
                    if (String.IsNullOrEmpty(option1str) == true && String.IsNullOrEmpty(option2str) == true && String.IsNullOrEmpty(option3str) == true && String.IsNullOrEmpty(option4str) == true)
                    {
                        lblmessage.Visible = true;
                        lblmessage.Text = "Por favor ingrese las respuestas";
                    }
                    else
                    {
                        //insert option1
                        SqlCommand insertquestionoption1cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                        insertquestionoption1cmd.Parameters.AddWithValue("questionid", quizquestionid);
                        insertquestionoption1cmd.Parameters.AddWithValue("questionoption", option1str);
                        insertquestionoption1cmd.Parameters.AddWithValue("lastupdated", updatedate);

                        db insertoption1 = new db();
                        insertoption1.ExecuteQuery(insertquestionoption1cmd);

                        //insert option2
                        SqlCommand insertquestionoption2cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                        insertquestionoption2cmd.Parameters.AddWithValue("questionid", quizquestionid);
                        insertquestionoption2cmd.Parameters.AddWithValue("questionoption", option2str);
                        insertquestionoption2cmd.Parameters.AddWithValue("lastupdated", updatedate);

                        db insertoption2 = new db();
                        insertoption2.ExecuteQuery(insertquestionoption2cmd);

                        //insert option3
                        if (String.IsNullOrEmpty(option3str) == false)
                        {
                            SqlCommand insertquestionoption3cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption3cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption3cmd.Parameters.AddWithValue("questionoption", option3str);
                            insertquestionoption3cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption3 = new db();
                            insertoption3.ExecuteQuery(insertquestionoption3cmd);
                        }

                        //insert option4
                        if (String.IsNullOrEmpty(option4str) == false)
                        {
                            SqlCommand insertquestionoption4cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption4cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption4cmd.Parameters.AddWithValue("questionoption", option4str);
                            insertquestionoption4cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption4 = new db();
                            insertoption4.ExecuteQuery(insertquestionoption4cmd);
                        }

                        //insert option5
                        if (String.IsNullOrEmpty(option5str) == false)
                        {
                            SqlCommand insertquestionoption5cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                            insertquestionoption5cmd.Parameters.AddWithValue("questionid", quizquestionid);
                            insertquestionoption5cmd.Parameters.AddWithValue("questionoption", option5str);
                            insertquestionoption5cmd.Parameters.AddWithValue("lastupdated", updatedate);

                            db insertoption5 = new db();
                            insertoption5.ExecuteQuery(insertquestionoption5cmd);
                        }
                    }

                    //insert answer
                    ddltype.Visible = false;
                    txtmultipleoption.ReadOnly = true;
                    txtmultipleoption1.ReadOnly = true;
                    txtmultipleoption2.ReadOnly = true;
                    txtmultipleoption3.ReadOnly = true;
                    txtmultipleoption4.ReadOnly = true;
                    txtmultipleoption5.ReadOnly = true;
                    txtmultipleoption.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption1.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption2.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption3.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption4.BackColor = System.Drawing.Color.LightBlue;
                    txtmultipleoption5.BackColor = System.Drawing.Color.LightBlue;
                    multiplequestionsubmit.Visible = false;
                    multipleanswersubmit.Visible = true;
                    lblanswer.Visible = true;
                    ddlmultipleanswer.Visible = true;

                    //get the available options
                    populateanswers(quizquestionid);
                }
                else
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "Sorry! we could not process your request. Please try again";
                }

            }

                else if (ImageCheckBox1.Checked == true & uploadedBytes == null)
                {
                    lblmessage.Visible = true;
                    lblmessage.Text = "Checkbox de imagen esta seleccionado";

                }

                
                
                }
           // else
            //{
              //      lblmessage.Visible = true;
               //     lblmessage.Text = "Sorry! we could not process your request. Please try again";
                //}
            //}
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Please enter the compulsory fields!";
            }
        
    }

    //multiple answer question
    protected void multipleanswersubmit_Click(object sender, EventArgs e)
    {
        int answerId = Convert.ToInt32(ddlmultipleanswer.SelectedItem.Value);
        int questionId = Convert.ToInt32(questionfield.Value);
        int insertid = 0;

        SqlCommand insertquestionanswercmd = new SqlCommand("insert into " + quizquestionanswertable + " (questionid, optionid, lastupdated) values (@questionid, @optionid, @lastupdated);SELECT CAST(scope_identity() AS int)");
        insertquestionanswercmd.Parameters.AddWithValue("questionid", questionId);
        insertquestionanswercmd.Parameters.AddWithValue("optionid", answerId);
        insertquestionanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

        db insertanswer = new db();
        insertid = insertanswer.ReturnIDonExecuteQuery(insertquestionanswercmd);

        //insert successful
        if (insertid > 0)
        {
            txtmultipleoption.Text = null;
            txtmultipleoption1.Text = null;
            txtmultipleoption2.Text = null;
            txtmultipleoption3.Text = null;
            txtmultipleoption4.Text = null;
            txtmultipleoption5.Text = null;
            txtmultipleoption.ReadOnly = false;
            txtmultipleoption1.ReadOnly = false;
            txtmultipleoption2.ReadOnly = false;
            txtmultipleoption3.ReadOnly = false;
            txtmultipleoption4.ReadOnly = false;
            txtmultipleoption5.ReadOnly = false;
            txtmultipleoption.BackColor = System.Drawing.Color.White;
            txtmultipleoption1.BackColor = System.Drawing.Color.White;
            txtmultipleoption2.BackColor = System.Drawing.Color.White;
            txtmultipleoption3.BackColor = System.Drawing.Color.White;
            txtmultipleoption4.BackColor = System.Drawing.Color.White;
            txtmultipleoption5.BackColor = System.Drawing.Color.White;
            lblanswer.Visible = false;
            ddlmultipleanswer.Visible = false;
            multipleanswersubmit.Visible = false;
            multiplequestionsubmit.Visible = true;

            lblmessage.Visible = true;
            lblmessage.Text = "Pregunta agregada exitosamente";

            ddltype.Visible = true;
            multipleoptiondiv.Visible = false;
            singleoptiondiv.Visible = false;
        }

    }

    //Populates multiple question options from quiz questions options table
    protected void populateanswers(int qId)
    {
        DataTable qTable = new DataTable();
        SqlCommand getanswers = new SqlCommand("select id, questionoption from " + quizquestionoptionstable + " where questionid=@questionid");
        getanswers.Parameters.AddWithValue("questionid", qId);

        db getanswerslist = new db();
        qTable = getanswerslist.returnDataTable(getanswers);

        if (qTable.Rows.Count > 0)
        {
            ddlmultipleanswer.DataSource = qTable;
            ddlmultipleanswer.DataTextField = "questionoption";
            ddlmultipleanswer.DataValueField = "id";
            ddlmultipleanswer.DataBind();
        }
        else
        {
            lblmessage.Visible = true;
            lblmessage.Text = "Nothing available at the moment";
        }
    }

    //Gets questions order from quiz questions table 
    protected int getquestionorder()
    {
        int temporder = 0;
        SqlDataReader dreader;
        SqlCommand findorder = new SqlCommand("select Top 1* from " + quizquestionstable + " where quizid=@quizid order by 'questionorder' Desc");
        findorder.Parameters.AddWithValue("quizid", quizId);

        db getorder = new db();
        dreader = getorder.returnDataReader(findorder);

        if (!dreader.HasRows)
        {
            temporder = 1;
        }
        else
        {
            while (dreader.Read())
            {
                string temporderstr = dreader["questionorder"].ToString();
                int itempos = Convert.ToInt32(temporderstr);
                temporder = itempos + 1;
            }
        }
        return temporder;
    }


    //Gets questions ID from quiz question options table
    protected int getquestionid()
    {
        int temporder = 0;
        SqlDataReader dreader;
        SqlCommand findid = new SqlCommand("select id from " + quizquestionoptionstable + " where questionid=@quizquestionid ");
        findid.Parameters.AddWithValue("quizquestionid", quizquestionid);

        db getorder = new db();
        dreader = getorder.returnDataReader(findid);


        if (!dreader.HasRows)
        {
            temporder = 1;
        }
        else
        {
            while (dreader.Read())
            {
                string temporderstr = dreader["id"].ToString();
                int ID = Convert.ToInt32(temporderstr);
                temporder = ID;
            }
        }
        return temporder;
    }


    //Gets questions ID from quiz question options table
    protected int getquizquestionid()
    {
        int temporder = 0;
        SqlDataReader dreader;
        SqlCommand findid = new SqlCommand("select id from " + quizquestionstable + " where questionorder=@qorder ");
        findid.Parameters.AddWithValue("qorder", qorder);

        db getorder = new db();
        dreader = getorder.returnDataReader(findid);


        if (!dreader.HasRows)
        {
            temporder = 1;
        }
        else
        {
            while (dreader.Read())
            {
                string temporderstr = dreader["id"].ToString();
                int ID = Convert.ToInt32(temporderstr);
                temporder = ID;
            }
        }
        return temporder;
    }



    protected void singleoptionsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Byte[] imagebytes;
            uploadedBytes = Page.Session["UploadedBytes"] as byte[];
            qorder = getquestionorder();
            qtype = ddltype.SelectedItem.Text.ToLower();
            string category = ddlCategorias2.SelectedItem.Text.Trim();
            int insertid = 0;

            string textoptionquestion = txtsingleoption.Text.Trim();
            string textoptionanswer = txtsingleoptionanswer.Text.Trim();
            string contenttype = "image/jpeg";


            if (ImageCheckBox.Checked == true & uploadedBytes != null)
            {
                imageFilename = Page.Session["ImageFilename"].ToString();
                ImageFilePath = Page.Session["ImageFilePath"].ToString();

                FileUploadControl1.PostedFile.SaveAs(Server.MapPath("~/") + imageFilename);

                // Read the file and convert it to Byte Array
                FileStream fs = new FileStream(ImageFilePath, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                imagebytes = br.ReadBytes((Int32)fs.Length);


                SqlCommand insertnew = new SqlCommand("insert into " + quizquestionstable + " (quizid, questionorder, type, title, lastupdated, image_name, content_type, data, category) values (@quizid, @questionorder, @type, @title, @lastupdated, @image_name, @content_type, @data, @category)");
                insertnew.Parameters.AddWithValue("quizid", quizId);
                insertnew.Parameters.AddWithValue("questionorder", qorder);
                insertnew.Parameters.AddWithValue("title", textoptionquestion);
                insertnew.Parameters.AddWithValue("type", qtype);
                insertnew.Parameters.AddWithValue("lastupdated", updatedate);
                insertnew.Parameters.AddWithValue("image_name", imageFilename);
                insertnew.Parameters.AddWithValue("content_type", contenttype);
                insertnew.Parameters.AddWithValue("data", uploadedBytes);
                insertnew.Parameters.AddWithValue("category", category);

                db insertnewquestion = new db();
                insertnewquestion.ExecuteQuery(insertnew);

                quizquestionid = getquizquestionid();

                SqlCommand insertquestionoption1cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                insertquestionoption1cmd.Parameters.AddWithValue("questionid", quizquestionid);
                insertquestionoption1cmd.Parameters.AddWithValue("questionoption", textoptionanswer);
                insertquestionoption1cmd.Parameters.AddWithValue("lastupdated", updatedate);

                db insertoption1 = new db();
                insertoption1.ExecuteQuery(insertquestionoption1cmd);

                int questionId = getquestionid();

                SqlCommand insertquestionanswercmd = new SqlCommand("insert into " + quizquestionanswertable + " (questionid, optionid, lastupdated) values (@questionid, @optionid, @lastupdated);SELECT CAST(scope_identity() AS int)");
                insertquestionanswercmd.Parameters.AddWithValue("questionid", quizquestionid);
                insertquestionanswercmd.Parameters.AddWithValue("optionid", questionId);
                insertquestionanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db insertanswer = new db();
                insertid = insertanswer.ReturnIDonExecuteQuery(insertquestionanswercmd);

                br.Close();
                fs.Close();

                lblmessage.Visible = true;
                lblmessage.Text = "Pregunta agregada exitosamente";

                multipleoptiondiv.Visible = false;
                singleoptiondiv.Visible = false;
                txtsingleoption.Text = null;
                txtsingleoptionanswer.Text = null;

            }

            else if (ImageCheckBox.Checked == false & uploadedBytes == null)

            {
                SqlCommand insertnew = new SqlCommand("insert into " + quizquestionstable + " (quizid, questionorder, title, type, lastupdated, category) values (@quizid, @questionorder, @title, @type, @lastupdated, @category);SELECT CAST(scope_identity() AS int)");
                insertnew.Parameters.AddWithValue("quizid", quizId);
                insertnew.Parameters.AddWithValue("questionorder", qorder);
                insertnew.Parameters.AddWithValue("type", qtype);
                insertnew.Parameters.AddWithValue("title", textoptionquestion);
                insertnew.Parameters.AddWithValue("lastupdated", updatedate);
                insertnew.Parameters.AddWithValue("category", category);


                db insertnewquestion = new db();
                insertnewquestion.ExecuteQuery(insertnew);

                quizquestionid = getquizquestionid();

                SqlCommand insertquestionoption1cmd = new SqlCommand("insert into " + quizquestionoptionstable + " (questionid, questionoption, lastupdated) values (@questionid, @questionoption, @lastupdated)");
                insertquestionoption1cmd.Parameters.AddWithValue("questionid", quizquestionid);
                insertquestionoption1cmd.Parameters.AddWithValue("questionoption", textoptionanswer);
                insertquestionoption1cmd.Parameters.AddWithValue("lastupdated", updatedate);

                db insertoption1 = new db();
                insertoption1.ExecuteQuery(insertquestionoption1cmd);

                int questionId = getquestionid();

                SqlCommand insertquestionanswercmd = new SqlCommand("insert into " + quizquestionanswertable + " (questionid, optionid, lastupdated) values (@questionid, @optionid, @lastupdated);SELECT CAST(scope_identity() AS int)");
                insertquestionanswercmd.Parameters.AddWithValue("questionid", quizquestionid);
                insertquestionanswercmd.Parameters.AddWithValue("optionid", questionId);
                insertquestionanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db insertanswer = new db();
                insertid = insertanswer.ReturnIDonExecuteQuery(insertquestionanswercmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Pregunta agregada exitosamente";

                multipleoptiondiv.Visible = false;
                singleoptiondiv.Visible = false;
                txtsingleoption.Text = null;
                txtsingleoptionanswer.Text = null;
            }

            else if (ImageCheckBox.Checked == true & uploadedBytes == null)
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Checkbox de imagen esta seleccionada";

            }

        }
        else
        {
            lblmessage.Visible = true;
            lblmessage.Text = "Please enter the compulsory fields!";
        }
    }

    protected void UploadButton_Click2(object sender, EventArgs e)
    {
        if (FileUploadControl2.HasFile)
        {
           
                if (FileUploadControl2.PostedFile.ContentType == "image/jpeg")
                {

                uploadedBytes = FileUploadControl2.FileBytes;
                imageFilename = Path.GetFileName(FileUploadControl2.FileName);
                ImageFilePath = (Server.MapPath("~/") + imageFilename);

                //Save the value in session object before the PostBack
                Page.Session["UploadedBytes"] = uploadedBytes;
                Page.Session["ImageFilename"] = imageFilename;
                Page.Session["ImageFilePath"] = ImageFilePath;

                string base64String = Convert.ToBase64String(uploadedBytes, 0, uploadedBytes.Length);
                Image3.ImageUrl = "data:image/jpeg;base64," + base64String;
                Image3.Visible = true;
                StatusLabel2.Text = "Imagen cargada: " + imageFilename;

            }
            else
                StatusLabel2.Text = "Estado de carga: Solo imagenes JPEG son aceptadas";            
          
        }
    }



    protected void UploadButton_Click1(object sender, EventArgs e)
    {
        if (FileUploadControl1.HasFile)
        {

            if (FileUploadControl1.PostedFile.ContentType == "image/jpeg")
            {

                uploadedBytes = FileUploadControl1.FileBytes;
                imageFilename = Path.GetFileName(FileUploadControl1.FileName);
                ImageFilePath = (Server.MapPath("~/") + imageFilename);

                //Save the value in session object before the PostBack
                Page.Session["UploadedBytes"] = uploadedBytes;
                Page.Session["ImageFilename"] = imageFilename;
                Page.Session["ImageFilePath"] = ImageFilePath;

                string base64String = Convert.ToBase64String(uploadedBytes, 0, uploadedBytes.Length);
                Image2.ImageUrl = "data:image/jpeg;base64," + base64String;
                Image2.Visible = true;
                StatusLabel1.Text = "Imagen cargada: " + imageFilename;

            }
            else
                StatusLabel1.Text = "Estado de carga: Solo imagenes JPEG son aceptadas";

        }
    }





    protected void ImageCheckBox_CheckedChanged(object sender, EventArgs e)
    {

        if (ImageCheckBox.Checked)
        {
            FileUploadControl1.Visible = true;
            UploadButton1.Visible = true;
            Image2.Visible = false;
            StatusLabel1.Visible = false;
        }
        else
        {
            FileUploadControl1.Visible = false;
            UploadButton1.Visible = false;
            Image2.Visible = false;
            StatusLabel1.Visible = false;
        }
    }


    protected void ImageCheckBox1_CheckedChanged(object sender, EventArgs e)
    {

        if (ImageCheckBox1.Checked)
        {
            FileUploadControl2.Visible = true;
            UploadButton2.Visible = true;
            Image3.Visible = false;
            StatusLabel2.Visible = false;
        }
        else
        {
            FileUploadControl2.Visible = false;
            UploadButton2.Visible = false;
            Image3.Visible = false;
            StatusLabel2.Visible = false;
        }
    }



}
 