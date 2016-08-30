namespace FinalTemplate.source.Functions
{
    public class CurrentUser
    {
        private Database.Database myDatabase = new Database.Database("cesConnectionString");

        public string AuthorizedID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PrimaryEmailAddress { get; set; }
        public string SecondaryEmailAddress { get; set; }
        public int UserTypeID { get; set; }
        public string UserType { get; set; }
        public int LoginCount { get; set; }
        public int AccountPin { get; set; }
        public string GeneralID { get; set; }
        public string LastLoginDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DateOfBirth { get; set; }
        public string Nationality { get; set; }
        public string Gender { get; set; }
        public string Photo { get; set; }
        public string Religion { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }

        public void GetAuthorizedDetails(string _authorizedid)
        {
            string[] columns = { "username", "password", "account_pin", "primary_email", "secondary_email", "usertype_id", "login_count", "last_login_date" };
            string[] where = { "authorized_id" };
            string[] whereOperator = { "=" };
            string[] wherevalue = { _authorizedid };
            string[] wheremultipleoperator = { "" };
            string[,] result = myDatabase.SelectQuery("tbl_authorized_users", columns, where, whereOperator, wherevalue, wheremultipleoperator);
        }
    }
}