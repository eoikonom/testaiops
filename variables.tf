variable "vsphere_user" {
  description = "vsphere user"
  
}

variable "vsphere_password" {
  description = "vsphere password"
  
}

variable "vsphere_server" {
  description = "vsphere server"
 
}

variable "datacenter" {
  description = "The name of the datacenter where the VM will be deployed"
  
}

variable "datastore" {
  description = "The name of the datastore where the VM will be stored"
 
}

variable "resource_pool" {
  description = "The name of the resource pool for the VM"
  
}

variable "cluster" {
  description = "The name of the vsphere cluster for the VM"
 
}

variable "vm_name" {
  description = "Name of the virtual machine"
 
}

variable "network" {
  description = "Name of the virtual machine network"
  
}

variable "template" {
  description = "Name of the virtual machine template"
  
}


variable "vm_cpu" {
  description = "Number of CPUs"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory size in GB"
  type        = number
  default     = 4
}

variable "vm_disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 50
}


variable "vm_ntp" {
  description = "NTP of the virtual machine"

}


variable "vm_domain" {
  description = "DNS domain of the virtual machine"
  default     = "gym.lan"
}

variable "vm_dns_list" {
  description = "Nameserver of the virtual machine"
  type        = list(string)
  default     = ["192.168.252.1"]
}

variable "vm_suffix_list" {
  description = "DNS search domains of the virtual machine"
  type        = list(string)
  default     = ["gym.lan"]
}

variable "vm_gateway" {
  description = "Gateway of the virtual machine"

}

variable "vm_netmask" {
  description = "Netmask of the virtual machine"

}


variable "vm_ip" {
  description = "Static IP of the virtual machine"

}

variable "vm_folder" {
  description = "Folder of the virtual machine"

}


