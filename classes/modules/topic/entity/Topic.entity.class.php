<?php
/*-------------------------------------------------------
*
*	Plugin "Skmapsimple"
*	Author: Zheleznov Sergey (skif)
*	Site: livestreet.ru/profile/skif/
*	Contact e-mail: sksdes@gmail.com
*
---------------------------------------------------------
*/
class PluginSkmapsimple_ModuleTopic_EntityTopic extends PluginSkmapsimple_Inherit_ModuleTopic_EntityTopic {

	public function getSkmapcoord() {
		return $this->getExtraValue('sk_map');
	}
	public function setSkmapcoord($data) {
		$this->setExtraValue('sk_map',$data);
	}
	public function getSkmapinfo() {
		return $this->getExtraValue('sk_map_info');
	}
	public function setSkmapinfo($data) {
		$this->setExtraValue('sk_map_info',$data);
	}
	public function getInfomessage() {
		return "<b>" . htmlspecialchars($this->getTitle(), ENT_QUOTES) . "</b><br/>" . htmlspecialchars($this->getSkmapinfo(), ENT_QUOTES);
	}
	public function getInfotitle() {
		return addslashes($this->getTitle());
	}
}
?>