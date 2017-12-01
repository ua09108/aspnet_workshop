using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;

namespace aspnet.webservice
{
    /// <summary>
    /// jsontransferashx2 的摘要描述
    /// </summary>
    public class jsontransferashx2 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //set the content type, you can either return plain text, html text, or json or other type    
            context.Response.ContentType = "text/plain";

            //deserialize the object
            UserInfo objUser = Deserialize<UserInfo>(context);

            //now we print out the value, we check if it is null or not
            if (objUser != null)
            {
                context.Response.Write(String.Format("You have entered Name: {0}, Email: {1}, Contact: {2}", objUser.Name, objUser.Email, objUser.Contact));
            }
            else
            {
                context.Response.Write("Sorry something goes wrong.");
            }
        }


        /// <summary>
        /// This function will take httpcontext object and will read the input stream
        /// It will use the built in JavascriptSerializer framework to deserialize object based given T object type value
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="context"></param>
        /// <returns></returns>
        public T Deserialize<T>(HttpContext context)
        {
            //read the json string
            string jsonData = new StreamReader(context.Request.InputStream).ReadToEnd();

            //cast to specified objectType
            var obj = (T)new JavaScriptSerializer().Deserialize<T>(jsonData);

            //return the object
            return obj;
        }

        // we create a class object to hold the JSON value
        public class UserInfo
        {
            public string Name { get; set; }
            public string Email { get; set; }
            public string Contact { get; set; }
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}