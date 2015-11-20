
<!-- Block categories module -->
{if $blockCategTree != ''}
	<div class="ma-nav-mobile-container  visible-xs ">
		<div class="navbar">
			<div id="navbar-inner" class="navbar-inner navbar-inactive">
				<a class="btn btn-navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<span class="brand">{l s='Category' mod='posmegamenu'}</span>
				<ul id="ma-mobilemenu" class="tree {if $isDhtml}dhtml{/if}  mobilemenu nav-collapse collapse">
					{foreach from=$blockCategTree.children item=child name=blockCategTree}
						{if $smarty.foreach.blockCategTree.last}
							{include file="$branche_tpl_path" node=$child last='true'}
						{else}
							{include file="$branche_tpl_path" node=$child}
						{/if}
					{/foreach}
				</ul>
                                <script type="text/javascript">
                                // <![CDATA[
                                        // we hide the tree only if JavaScript is activated
                                        $('div#categories_block_left ul.dhtml').hide();
                                // ]]>
                                </script>
			</div>
		</div>
</div>
{/if}
<!-- /Block categories module -->

<div class="nav-container visible-lg visible-md visible-sm">
    <div id="pt_custommenu" class="pt_custommenu">
        {$megamenu}
    </div>
</div>

<script type="text/javascript">
//<![CDATA[
var CUSTOMMENU_POPUP_EFFECT = {$effect};
var CUSTOMMENU_POPUP_TOP_OFFSET = {$top_offset};
//]]>
</script>
<script type="text/javascript">
 $(document).ready(function(){
 
  $(window).scroll(function() {    
   var scroll = $(window).scrollTop();
   if (scroll < 245) {
    $(".header-bottom").removeClass("scroll-menu");
   }else{
    $(".header-bottom").addClass("scroll-menu");
   }
  });
 });
</script>.