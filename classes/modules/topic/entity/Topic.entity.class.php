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

}
?>