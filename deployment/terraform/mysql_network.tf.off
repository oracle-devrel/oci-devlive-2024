locals {
  private_subnet_cidr     = "10.0.1.0/28"
  tcp_protocol            = "6"
}

data "oci_core_vcn" "oke_vcn" {
  vcn_id = module.oke.vcn_id
}

resource "oci_core_subnet" "mysql_subnet" {
  cidr_block                 = local.private_subnet_cidr
  compartment_id             = var.compartment_ocid
  vcn_id                     = module.oke.vcn_id
  display_name               = "mysql_subnet_${var.project_name}_${random_string.deploy_id.result}"
  dns_label                  = "mysql"
  prohibit_public_ip_on_vnic = true
  security_list_ids          = [data.oci_core_vcn.oke_vcn.default_security_list_id, oci_core_security_list.mysql_security_list.id]
  route_table_id             = data.oci_core_vcn.oke_vcn.default_route_table_id
  dhcp_options_id            = data.oci_core_vcn.oke_vcn.default_dhcp_options_id
}

resource "oci_core_security_list" "mysql_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = module.oke.vcn_id
  display_name   = "MySQL Security List"

  ingress_security_rules {
    protocol  = local.tcp_protocol
    source    = local.anywhere
    stateless = false

    tcp_options {
      min = 3306
      max = 3306
    }
  }

  ingress_security_rules {
    protocol  = local.tcp_protocol
    source    = local.anywhere
    stateless = false

    tcp_options {
      min = 33060
      max = 33060
    }
  }
}
