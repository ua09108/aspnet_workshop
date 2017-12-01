using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;

namespace aspnet.webservice
{
    /// <summary>
    /// callwebmethod 的摘要描述
    /// </summary>
    public class callwebmethod : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
           
            context.Response.ContentType = "text/plain";
            string json = string.Empty;
            string message = string.Empty;
            bool result = false;

            using (var reader = new StreamReader(context.Request.InputStream))
            {
                json = reader.ReadToEnd();
            }

            if (!string.IsNullOrEmpty(json))
            {
                var personList = new JavaScriptSerializer().Deserialize<List<Person>>(json);

                foreach (Person p in personList)
                {
                    result = true;
                    message += p.Name + ":" + p.Age;
                }
            }

            this.SendResponse(context, result, message);

        }
        private void SendResponse(HttpContext context, bool result, string message)
        {
            context.Response.Write(new JavaScriptSerializer().Serialize(
                new
                {
                    Result = result,
                    Message = message
                }));

            context.Response.End();
        }


        public class Person
        {
            public string Name { get; set; }
            public int Age { get; set; }
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