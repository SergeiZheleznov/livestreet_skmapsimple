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

class PluginSkmapsimple_ActionTopic extends PluginSkmapsimple_Inherit_ActionTopic {

    protected function EventEdit(){
    	parent::EventEdit();

    	$sTopicId=$this->GetParam(0);
		if (!($oTopic=$this->Topic_GetTopicById($sTopicId))) {
			return;
		}

    	$_REQUEST['topic_skmapcord']=$oTopic->getSkmapcoord();
    }
}
?>