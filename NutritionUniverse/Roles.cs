using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace NutritionUniverse
{
    public class Roles : RoleProvider
    {
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }


        public override string[] GetRolesForUser(string username)
        {
            SqlConnection cnx = new SqlConnection(Properties.Settings.Default.chaineCNX);
            cnx.Open();
            SqlCommand cmd = new SqlCommand("select Catégorie from Compte where Username=@log", cnx);
            cmd.Parameters.AddWithValue("@log", username);
            string log = cmd.ExecuteScalar().ToString();
            cnx.Close();
            return new string[] { log };
        }


        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}