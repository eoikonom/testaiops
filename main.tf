data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}



resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  folder           = var.vm_folder
  num_cpus         = var.vm_cpu
  memory           = var.vm_memory * 1024 # Convert GB to MB
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  firmware         = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    ##size  = data.vsphere_virtual_machine.template.disks.0.size
    size             = var.vm_disk_size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }


  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {

      # Conditionally add windows_options block if os_type is "windows"
      dynamic "windows_options" {
        for_each = var.os_type == "windows" ? [1] : []
        content {
          computer_name  = var.vm_name
        }
      }

      # Conditionally add linux_options block if os_type is "linux"
      dynamic "linux_options" {
        for_each = var.os_type == "linux" ? [1] : []
        content {
          host_name = var.vm_name
          domain    = var.vm_domain
        }
      }

      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = var.vm_netmask
      }
      ipv4_gateway    = var.vm_gateway
      dns_server_list = var.vm_dns_list
      dns_suffix_list = var.vm_suffix_list

    }

  }
}
