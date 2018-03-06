using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Linq;
using System.IO;
using System.Drawing;
using System.Runtime.Serialization.Formatters.Binary;
using System.Configuration;

public partial class Admin_editquestion : System.Web.UI.Page
{
    string quizdetailstable = "quizdetails";
    string quizquestionstable = "quiz_questions";
    string quizquestionoptionstable = "question_options";
    string quizquestionanswertable = "question_answer";
    string qstring = "0";
    int qId = 0;
    int tempval = 0;
    byte[] uploadedBytes;
    string imageFilename;
    string ImageFilePath;
    DateTime updatedate = new DateTime();

    string qtype = "";
    string questionstr = "";
    string answerstr = "";
    string textoptionstr = "";
    Byte[] bytes;

    protected void Page_Load(object sender, EventArgs e)
    {
        updatedate = DateTime.Now;

        if (!Page.IsPostBack)
        {
            //get the query string value
            if (Page.Request["q"] == null)
            {
                editquestiondiv.InnerHtml = "<br /><span style='color:#FF0000; font-size:15px;'>Please select a question first and try again.</span><br /><br />";
            }
            else
            {
                qstring = Page.Request["q"].ToString();
                qId = Convert.ToInt32(qstring);

                //strore the quiz id in hidden field
                questionfield.Value = qstring;

                bindquestion();
            }
        }
        else
        {
            if (int.TryParse(questionfield.Value, out tempval) == true)
            {
                qId = tempval;
            }
            else
            {
                editquestiondiv.InnerHtml = "<br /><span style='color:#FF0000; font-size:15px;'>Please select a question first and try again.</span><br /><br />";
            }
        }

        //add javascript event
        multipleoptionsubmit.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + multipleoptionsubmit.ClientID + ".disabled=true; " + multipleoptionsubmit.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(multipleoptionsubmit, ""));
        singleoptionsubmit.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + singleoptionsubmit.ClientID + ".disabled=true; " + singleoptionsubmit.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(singleoptionsubmit, ""));

    }

    protected void bindquestion()
    {
        SqlDataReader dreader;
        SqlCommand getquestioncmd = new SqlCommand("select id, quizid, type, title from " + quizquestionstable + " where id=@questionid");
        getquestioncmd.Parameters.AddWithValue("questionid", qId);

        db getquestion = new db();
        dreader = getquestion.returnDataReader(getquestioncmd);

        if (!dreader.HasRows)
        {
            editquestiondiv.InnerHtml = "<br /><span style='color:#FF0000; font-size:15px;'>Sorry! we could not complete your request at this time. please try again later.</span><br />";
        }
        else
        {
            while (dreader.Read())
            {
                //set the home link
                string quizidstr = dreader["quizid"].ToString();
                HyperLink homelink = (HyperLink)Master.FindControl("homelnk");
                if (homelink != null)
                {
                    homelink.NavigateUrl = "setquestions?q=" + quizidstr;
                }

                //detect question type and set the template
                qtype = dreader["type"].ToString();

                if (qtype == "multiple")
                {
                    multipleoptiondiv.Visible = true;
                    singleoptiondiv.Visible = false;

                    questionstr = dreader["title"].ToString();
                    txtmultipleoption.Text = questionstr;
                    Image3.Visible = false;
                    StatusLabel3.Visible = false;
                    FileUploadControl3.Visible = false;
                    UploadButton3.Visible = false;

                    populateoptions(qId);

                    bytes = showimage();

                    if (bytes != null)
                    {
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image3.ImageUrl = "data:image/jpeg;base64," + base64String;
                        Image3.Visible = true;
                        FileUploadControl3.Visible = true;
                        UploadButton3.Visible = true;
                    }
                }
                else if (qtype == "single")
                {
                    multipleoptiondiv.Visible = false;
                    singleoptiondiv.Visible = true;
                    Image2.Visible = false;
                    StatusLabel2.Visible = false;
                    FileUploadControl2.Visible = false;
                    UploadButton2.Visible = false;

                    questionstr = dreader["title"].ToString();

                    txtsingleoption.Text = questionstr;
                    txtsingleoptionanswer.Text = populatesingleoptions(qId);

                    bytes = showimage();
                    if (bytes != null)
                    {
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image2.ImageUrl = "data:image/jpeg;base64," + base64String;
                        Image2.Visible = true;
                        FileUploadControl2.Visible = true;
                        UploadButton2.Visible = true;
                    }
                }

              
                else
                {
                    //do nothing for time being
                }
            }
        }
    }


    // Pendiente 
    // Testear update con imagen y sin imagen 

    protected byte[] showimage()
    {
        SqlDataReader dreader;
        Byte[] ArrayIn = { };
        SqlCommand cmd = new SqlCommand("select data from " + quizquestionstable + " where id=@qId");
        cmd.Parameters.AddWithValue("qId", qId);

        db getorder = new db();
        dreader = getorder.returnDataReader(cmd);


        if (dreader.HasRows)
        {
            while (dreader.Read())
            {
                Byte [] temporderstr = dreader["data"] as byte[];

                ArrayIn = temporderstr;
               
            }
        }

        return ArrayIn;
    }

   

    protected void populateoptions(int QID)
    {
        string answeridstr = "";
        List<string[]> allRows = new List<string[]>();
        SqlDataReader dReader;
        SqlCommand getanswerscmd = new SqlCommand("select a.id, a.questionoption, b.optionid from " + quizquestionoptionstable + " as a inner join " + quizquestionanswertable + " as b on a.questionid=b.questionid where a.questionid=@questionid");
        getanswerscmd.Parameters.AddWithValue("questionid", QID);

        db getanswerslist = new db();
        dReader = getanswerslist.returnDataReader(getanswerscmd);

        if (dReader.HasRows)
        {
            while (dReader.Read())
            {
                allRows.Add(new string[] { dReader["id"].ToString(), dReader["questionoption"].ToString() });
                answeridstr = dReader["optionid"].ToString();
            }

            //populate the answer dropdown
            lblanswer.Visible = true;
            ddlmultipleanswer.DataSource = from obj in allRows
                                         select new
                                         {
                                             id = obj[0],
                                             questionoption = obj[1]
                                         };
            ddlmultipleanswer.DataBind();
            ddlmultipleanswer.Items.FindByValue(answeridstr).Selected = true;

            //populate the options text boxes
            int itemcount = 0;
            string optionstr = "";
            string optionidstr = "";
            foreach (string[] arr in allRows)
            {
                itemcount++;
                optionidstr = arr[0].ToString();
                optionstr = arr[1].ToString();

                if (itemcount == 1)
                {
                    txtmultipleoption1.Text = optionstr;
                    hfoption1.Value = optionidstr;
                }
                else if (itemcount == 2)
                {
                    txtmultipleoption2.Text = optionstr;
                    hfoption2.Value = optionidstr;
                }
                else if (itemcount == 3)
                {
                    txtmultipleoption3.Text = optionstr;
                    hfoption3.Value = optionidstr;
                }
                else if (itemcount == 4)
                {
                    txtmultipleoption4.Text = optionstr;
                    hfoption4.Value = optionidstr;
                }
                else if (itemcount == 5)
                {
                    txtmultipleoption5.Text = optionstr;
                    hfoption5.Value = optionidstr;
                }
            }
        }
        else
        {
            txtmultipleoption1.Text = null;
            txtmultipleoption2.Text = null;
            txtmultipleoption3.Text = null;
            txtmultipleoption4.Text = null;
            txtmultipleoption5.Text = null;

            lblanswer.Visible = false;
            ddlmultipleanswer.Visible = false;
        }
    }



    protected string populatesingleoptions(int QID)
    {
        string answeridstr = "";
        SqlDataReader dReader;
        SqlCommand getanswerscmd = new SqlCommand("select a.questionoption from " + quizquestionoptionstable + " as a inner join " + quizquestionanswertable + " as b on a.questionid=b.questionid where a.questionid=@questionid");
        getanswerscmd.Parameters.AddWithValue("questionid", QID);

        db getanswer = new db();
        dReader = getanswer.returnDataReader(getanswerscmd);

        if (dReader.HasRows)
        {
            while (dReader.Read())
            {
                answeridstr = dReader["questionoption"].ToString();

            }
        }

        return answeridstr;
    }



    protected void multipleoptionsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Byte[] imagebytes;
            uploadedBytes = Page.Session["UploadedBytes"] as byte[];
            string category = ddlCategorias1.SelectedItem.Text.Trim();

            questionstr = txtmultipleoption.Text.Trim();
            answerstr = ddlmultipleanswer.SelectedItem.Value;
            string contenttype = "image/jpeg";

            if (bytes != null)
            {

                FileUploadControl3.PostedFile.SaveAs(Server.MapPath("~/") + imageFilename);
                imageFilename = Page.Session["ImageFilename"].ToString();
                ImageFilePath = Page.Session["ImageFilePath"].ToString();

                // Read the file and convert it to Byte Array
                FileStream fs = new FileStream(ImageFilePath, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                imagebytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand updatequestioncmd = new SqlCommand("update " + quizquestionstable + " set title=@title, lastupdated=@lastupdated, image_name=@image_name, content_type=@content_type, data=@data, category=@category where id=@questionid");
                updatequestioncmd.Parameters.AddWithValue("questionid", qId);
                updatequestioncmd.Parameters.AddWithValue("title", questionstr);
                updatequestioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                updatequestioncmd.Parameters.AddWithValue("image_name", imageFilename);
                updatequestioncmd.Parameters.AddWithValue("content_type", contenttype);
                updatequestioncmd.Parameters.AddWithValue("data", uploadedBytes);
                updatequestioncmd.Parameters.AddWithValue("category", category);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updatequestioncmd);

                //update answer
                SqlCommand updateanswercmd = new SqlCommand("update " + quizquestionanswertable + " set optionid=@optionid, lastupdated=@lastupdated where questionid=@questionid");
                updateanswercmd.Parameters.AddWithValue("questionid", qId);
                updateanswercmd.Parameters.AddWithValue("optionid", answerstr);
                updateanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db updateanswer = new db();
                updateanswer.ExecuteQuery(updateanswercmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Question updated successfully!";

                bindquestion();

            }
            else
            {
                //update question
                SqlCommand updatequestioncmd = new SqlCommand("update " + quizquestionstable + " set title=@title, lastupdated=@lastupdated, category=@category where id=@questionid");
                updatequestioncmd.Parameters.AddWithValue("questionid", qId);
                updatequestioncmd.Parameters.AddWithValue("title", questionstr);
                updatequestioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                updatequestioncmd.Parameters.AddWithValue("category", category);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updatequestioncmd);

                //update answer
                SqlCommand updateanswercmd = new SqlCommand("update " + quizquestionanswertable + " set optionid=@optionid, lastupdated=@lastupdated where questionid=@questionid");
                updateanswercmd.Parameters.AddWithValue("questionid", qId);
                updateanswercmd.Parameters.AddWithValue("optionid", answerstr);
                updateanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db updateanswer = new db();
                updateanswer.ExecuteQuery(updateanswercmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Question updated successfully!";

                bindquestion();
            }

           
        }
        else
        {
            lblmessage.Visible = true;
            lblmessage.Text = "Please enter the compulsory fields!";
        }
    }

    protected void singleoptionsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            Byte[] imagebytes;
            uploadedBytes = Page.Session["UploadedBytes"] as byte[];
            string category = ddlCategorias2.SelectedItem.Text.Trim();

            string contenttype = "image/jpeg";
            questionstr = txtsingleoption.Text.Trim();
            answerstr = txtsingleoptionanswer.Text.Trim();

            if (bytes != null)
            {
                imageFilename = Page.Session["ImageFilename"].ToString();
                ImageFilePath = Page.Session["ImageFilePath"].ToString();
                FileUploadControl2.PostedFile.SaveAs(Server.MapPath("~/") + imageFilename);

                // Read the file and convert it to Byte Array
                FileStream fs = new FileStream(ImageFilePath, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                imagebytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand updatequestioncmd = new SqlCommand("update " + quizquestionstable + " set title=@title, lastupdated=@lastupdated, image_name=@image_name, content_type=@content_type, data=@data, category=@category where id=@questionid");
                updatequestioncmd.Parameters.AddWithValue("questionid", qId);
                updatequestioncmd.Parameters.AddWithValue("title", questionstr);
                updatequestioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                updatequestioncmd.Parameters.AddWithValue("image_name", imageFilename);
                updatequestioncmd.Parameters.AddWithValue("content_type", contenttype);
                updatequestioncmd.Parameters.AddWithValue("data", uploadedBytes);
                updatequestioncmd.Parameters.AddWithValue("category", category);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updatequestioncmd);

                //update answer
                SqlCommand updateanswercmd = new SqlCommand("update " + quizquestionoptionstable + " set questionoption=@questionoption, lastupdated=@lastupdated where questionid=@questionid");
                updateanswercmd.Parameters.AddWithValue("questionid", qId);
                updateanswercmd.Parameters.AddWithValue("questionoption", answerstr);
                updateanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db updateanswer = new db();
                updateanswer.ExecuteQuery(updateanswercmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Question added successfully!";

                bindquestion();

            }
            else
            {
                SqlCommand updatequestioncmd = new SqlCommand("update " + quizquestionstable + " set title=@title, lastupdated=@lastupdated, category=@category where id=@questionid");
                updatequestioncmd.Parameters.AddWithValue("questionid", qId);
                updatequestioncmd.Parameters.AddWithValue("title", questionstr);
                updatequestioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                updatequestioncmd.Parameters.AddWithValue("category", category);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updatequestioncmd);

                //update answer
                SqlCommand updateanswercmd = new SqlCommand("update " + quizquestionoptionstable + " set questionoption=@questionoption, lastupdated=@lastupdated where questionid=@questionid");
                updateanswercmd.Parameters.AddWithValue("questionid", qId);
                updateanswercmd.Parameters.AddWithValue("questionoption", answerstr);
                updateanswercmd.Parameters.AddWithValue("lastupdated", updatedate);

                db updateanswer = new db();
                updateanswer.ExecuteQuery(updateanswercmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Question added successfully!";

                bindquestion();

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
                Image2.ImageUrl = "data:image/jpeg;base64," + base64String; //+ "?r" + DateTime.Now.Ticks.ToString();
                StatusLabel2.Text = "Uploaded image: " + imageFilename;

            }
            else
                StatusLabel2.Text = "Upload status: Only JPEG files are accepted!";

        }
    }



    protected void UploadButton_Click3(object sender, EventArgs e)
    {
        if (FileUploadControl3.HasFile)
        {

            if (FileUploadControl3.PostedFile.ContentType == "image/jpeg")
            {

                uploadedBytes = FileUploadControl3.FileBytes;
                imageFilename = Path.GetFileName(FileUploadControl3.FileName);
                ImageFilePath = (Server.MapPath("~/") + imageFilename);

                //Save the value in session object before the PostBack
                Page.Session["UploadedBytes"] = uploadedBytes;
                Page.Session["ImageFilename"] = imageFilename;
                Page.Session["ImageFilePath"] = ImageFilePath;

                string base64String = Convert.ToBase64String(uploadedBytes, 0, uploadedBytes.Length);
                Image3.ImageUrl = "data:image/jpeg;base64," + base64String; //+ "?r" + DateTime.Now.Ticks.ToString();
                StatusLabel3.Text = "Uploaded image: " + imageFilename;

            }
            else
                StatusLabel3.Text = "Upload status: Only JPEG files are accepted!";

        }
    }




    protected void txtmultipleoptioncategory_TextChanged(object sender, EventArgs e)
    {

        string category = "";
        string reqcontrol = getPostBackControlName();
        Page.Validate();
        if (Page.IsValid)
        {

            if (reqcontrol == "ddlCategorias1")
            {
                category = ddlCategorias1.SelectedItem.Text.Trim();

                SqlCommand updateoptioncmd = new SqlCommand("update " + quizquestionstable + " set category=@category, lastupdated=@lastupdated where questionid=@questionid");
                updateoptioncmd.Parameters.AddWithValue("questionid", qId);
                updateoptioncmd.Parameters.AddWithValue("lastupdated", updatedate);
                updateoptioncmd.Parameters.AddWithValue("category", category);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updateoptioncmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Category updated successfully!";
            }
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Sorry! we could not complete your request at this time. please try again later.";
            }

        }


    }


//when answers updated
protected void txtmultipleoption_TextChanged(object sender, EventArgs e)
    {
        int optionId = 0;
        Page.Validate();
        if (Page.IsValid)
        {
            string reqcontrol = getPostBackControlName();

            if (reqcontrol == "txtmultipleoption1")
            {
                optionId = Convert.ToInt32(hfoption1.Value);
                answerstr = txtmultipleoption1.Text.Trim();
            }
            else if (reqcontrol == "txtmultipleoption2")
            {
                optionId = Convert.ToInt32(hfoption2.Value);
                answerstr = txtmultipleoption2.Text.Trim();
            }
            else if (reqcontrol == "txtmultipleoption3")
            {
                optionId = Convert.ToInt32(hfoption3.Value);
                answerstr = txtmultipleoption3.Text.Trim();
            }
            else if (reqcontrol == "txtmultipleoption4")
            {
                optionId = Convert.ToInt32(hfoption4.Value);
                answerstr = txtmultipleoption4.Text.Trim();
            }
            else if (reqcontrol == "txtmultipleoption5")
            {
                optionId = Convert.ToInt32(hfoption5.Value);
                answerstr = txtmultipleoption5.Text.Trim();
            }

            if (String.IsNullOrEmpty(reqcontrol) == false && optionId > 0)
            {

                SqlCommand updateoptioncmd = new SqlCommand("update " + quizquestionoptionstable + " set questionoption=@questionoption, lastupdated=@lastupdated where id=@optionid and questionid=@questionid");
                updateoptioncmd.Parameters.AddWithValue("optionid", optionId);
                updateoptioncmd.Parameters.AddWithValue("questionid", qId);
                updateoptioncmd.Parameters.AddWithValue("questionoption", answerstr);
                updateoptioncmd.Parameters.AddWithValue("lastupdated", updatedate);

                db updatequestion = new db();
                updatequestion.ExecuteQuery(updateoptioncmd);

                lblmessage.Visible = true;
                lblmessage.Text = "Option updated successfully!";

                bindquestion();
            }
            else
            {
                lblmessage.Visible = true;
                lblmessage.Text = "Sorry! we could not complete your request at this time. please try again later.";
            }
        }
        else
        {
            lblmessage.Visible = true;
            lblmessage.Text = "Please enter the compulsory fields!";
        }
    }

    //get the control that cause postback
    private string getPostBackControlName()
    {
        string controlid = "";
        Control control = null;
        //first we will check the "__EVENTTARGET" because if post back made by the controls
        //which used "_doPostBack" function also available in Request.Form collection.

        string ctrlname = Page.Request.Params["__EVENTTARGET"];
        if (ctrlname != null && ctrlname != String.Empty)
        {
            control = Page.FindControl(ctrlname);
        }

        // if __EVENTTARGET is null, the control is a button type and we need to
        // iterate over the form collection to find it
        else
        {
            string ctrlStr = String.Empty;
            Control c = null;
            foreach (string ctl in Page.Request.Form)
            {
                //handle ImageButton they having an additional "quasi-property" in their Id which identifies
                //mouse x and y coordinates
                if (ctl.EndsWith(".x") || ctl.EndsWith(".y"))
                {
                    ctrlStr = ctl.Substring(0, ctl.Length - 2);
                    c = Page.FindControl(ctrlStr);
                }
                else
                {
                    c = Page.FindControl(ctl);
                }
                if (c is System.Web.UI.WebControls.Button ||
                         c is System.Web.UI.WebControls.ImageButton)
                {
                    control = c;
                    break;
                }
            }
        }
        if (control == null)
        {
            controlid = "pageload";
        }
        else
        {
            controlid = control.ID.ToString();
        }
        return controlid;
    }
}