resource "oci_mysql_mysql_db_system" "my_mysql_db" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaasyobvmmuox4y5l4v47ubn367uglbpk3y7xgu6orf7p5eeflb4dgq"
  display_name   = "ofour"
  shape_name     = "MySQL.VM.Standard.E2.1"
  mysql_version  = "8.0.28"
  
  admin_password = "@ZK.pgh9eP#.y6F"
  subnet_id      = "ocid1.subnet.oc1.eu-paris-1.aaaaaaaapldg6kvruplsqr62c4hs2rzm4wybnearxceucnrv27dz67ynjama"
  
  data_storage_size_in_gb = 20
}

resource "oci_mysql_mysql_database" "my_database" {
  db_system_id = oci_mysql_mysql_db_system.my_mysql_db.id
  db_name      = "mydatabase"
}
