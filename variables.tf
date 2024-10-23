variable "vsphere_user" {
  description = "vsphere user"
  default     = "gymuser-c8enn1ds@techzone.ibm.local"
}

variable "vsphere_password" {
  description = "vsphere password"
  default     = "kPzeZtbR"
}

variable "vsphere_server" {
  description = "vsphere server"
  default     = "ocpgym-vc.techzone.ibm.local"
}

variable "datacenter" {
  description = "The name of the datacenter where the VM will be deployed"
  default     = "IBMCloud"
}

variable "datastore" {
  description = "The name of the datastore where the VM will be stored"
  default     = "gym-664003157g-c8enn1ds-storage"
}

variable "resource_pool" {
  description = "The name of the resource pool for the VM"
  default     = "/IBMCloud/host/ocp-gym/Resources/Cluster Resource Pool/Gym Member Resource Pool/gym-664003157g-c8enn1ds"
}

variable "cluster" {
  description = "The name of the vsphere cluster for the VM"
  default     = "ocp-gym"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "mytestvm1"
}

variable "network" {
  description = "Name of the virtual machine network"
  default     = "gym-664003157g-c8enn1ds-segment"
}

variable "template" {
  description = "Name of the virtual machine template"
  default     = "rhel8-template"
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
  description = "hostname of the virtual machine"
  default     = "162.159.200.1"
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
  default     = "192.168.252.1"
}

variable "vm_netmask" {
  description = "Netmask of the virtual machine"
  default     = 24
}


variable "vm_ip" {
  description = "Static IP of the virtual machine"
  default     = "192.168.252.81"
}

variable "vm_folder" {
  description = "Folder of the virtual machine"
  default     = "/ocp-gym/gym-664003157g-c8enn1ds"
}


