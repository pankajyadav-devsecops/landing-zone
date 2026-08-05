module "rgs" {
    source = "../../Module/resource-group"
    rgs=var.rgs
}
module "vnets" {
  source = "../../Module/virtual-network"
  vnets = var.vnets
  depends_on = [ module.rgs ]
}
module "subnets" {
  source = "../../Module/subnet"
  subnets1 = var.subnets1
  depends_on =[module.vnets]
}
module "pips"{
    source = "../../Module/public-ip"
    pip =var.pip
    depends_on = [ module.rgs ]
}
module "nic" {
    source = "../../Module/nic"
  nics =var.nics
  depends_on = [ module.subnets1, module.pips ]
}
module "vm" {
    source = "../../Module/virtual-machine"
    vms=var.vms
    depends_on = [ module.nic ]
  
}
