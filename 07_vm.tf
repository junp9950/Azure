#VM만들기
resource "azurerm_virtual_machine" "vm-jwshin" {
  name                  = "jwshin-vm"
  location              = azurerm_resource_group.jw_rg.location
  resource_group_name   = azurerm_resource_group.jw_rg.name
  network_interface_ids = [azurerm_network_interface.nif_jw.id]
  vm_size               = "Standard_DS1_v2" #VM 크기
  storage_image_reference {                 #이미지
    publisher = "OpenLogic"                 #발행 : 오픈로직
    offer     = "CentOS"                    #운영체제
    sku       = "7.5"                       #버전
    version   = "latest"                    #버전최신인가?
  }
  storage_os_disk { #디스크옵션
    name              = "jeewoongdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS" #디스크타입
  }
  os_profile {
    computer_name  = "junp" #베스천 접속시  rara@junp~ # <--이렇게뜸 
    admin_username = "rara"
    admin_password = "tlswldnd123@"
  }
  os_profile_linux_config {
    disable_password_authentication = false #인증형식  (password 인증방식을 disable 하겠느냐? : false아니오)
  }

}
