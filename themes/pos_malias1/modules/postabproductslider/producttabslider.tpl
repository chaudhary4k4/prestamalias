
<script type="text/javascript">

$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 {$tab_effect}");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 {$tab_effect}");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
{if $page_name == 'index'}	
<div class="product-tabs-container-slider">
	<ul class="tabs"> 
	{$count=0}
	{foreach from=$productTabslider item=productTab name=posTabProduct}
		<li class="{if $smarty.foreach.posTabProduct.first}first_item{elseif $smarty.foreach.posTabProduct.last}last_item{else}{/if} item {if $count==0} active {/if}" rel="tab_{$productTab.id}"  >
			{$productTab.name}
		</li>
			{$count= $count+1}
	{/foreach}	
	</ul>

	<div class="tab_container"> 
	{foreach from=$productTabslider item=productTab name=posTabProduct}
		<div id="tab_{$productTab.id}" class="tab_content">
			<div class="productTabContent row">
			{foreach from=$productTab.productInfo item=product name=posFeatureProducts}
			
				<div class="slider_item col-md-4 col-sm-6 col-xs-12">
					<div class="item-inner">
						<a class = "bigpic_{$product.id_product}_tabproduct tabproduct-img product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
							<img class="replace-2x" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.legend|escape:'html':'UTF-8'}" />
						<!-- 	{if isset($product.new) && $product.specific_prices} 
								{if $product.specific_prices}<span class="sale">{l s='Sale' mod='postabproduct'}</span>{/if}
							{else}
							{if isset($product.new) && $product.new == 1}<span class="new">{l s='New' mod='postabproduct'} </span>{/if}
							{if $product.specific_prices}<span class="sale">{l s='Sale' mod='postabproduct'}</span>{/if}
							{/if}	 -->							
						</a>
						<div class="product-contents">
							<h5 class="product-name"><a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
							<!-- {if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
							<div class="price-box"><span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span></div>{else}<div style="height:21px;"></div>{/if} -->
							{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							<div  class="price-box">
								{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
								
									{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$product.price_without_reduction}
										</span>
										{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
										{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
										{/if}
									{/if}
									<span class="price product-price">
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{/if}
							</div>
							{/if}
							<div class="ratings">{hook h='displayProductListReviews' product=$product}</div>	
							<div class="actions_tab">
								
								<div class="acctions-inner">
									<div class="cart">
										{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
										{if ($product.allow_oosp || $product.quantity > 0)}
										{if isset($static_token)}
											<a class="button ajax_add_to_cart_button btn btn-default" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Add to cart'  mod='postabproduct'}" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow"  title="{l s='' mod='postabcategory'}" data-id-product="{$product.id_product|intval}">
												<span><i class="fa fa-plus-square"></i> {l s='Add to cart' mod='postabproduct'}</span>
												
											</a>
										{else}
										<a class="button ajax_add_to_cart_button btn btn-default" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Add to cart'  mod='postabproduct'}"  href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='' mod='postabcategory'}" data-id-product="{$product.id_product|intval}">
											<span>{l s='Add to cart' mod='postabproduct'}</span>
										</a>
										   {/if}      
										{else}
										<span class="button ajax_add_to_cart_button btn btn-default disabled" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Add to cart'  mod='postabproduct'}" >
											<span>{l s='Add to cart' mod='postabproduct'}</span>
										</span>
										{/if}
										{/if}
									</div>
									<ul class="add-to-links">
									
										<li>
											<a class="addToWishlist wishlistProd_{$product.id_product|intval}"  data-toggle="tooltip" data-placement="top" data-original-title="{l s='Wishlist' mod='postabproduct'}" href="#" data-wishlist="{$product.id_product|intval}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
												<span>{l s="Wishlist" mod='postabproduct'}</span>
												
											</a>
										</li>
										<li>
											
											{if isset($comparator_max_item) && $comparator_max_item}
											  <a class="add_to_compare" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Compare' mod='postabproduct'}"  href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"><i class="fa fa-retweet"></i>{l s='Compare' mod='postabproduct'}
											
											  </a>
											 {/if}
						
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			{/foreach}
			</div>
				
				</div>
	<!-- 		<script type="text/javascript"> 
				  $(".product-tabs-container-slider #tab_{$productTab.id} .productTabContent").bxSlider({
						slideWidth:{if $slideOptions.p_width != ''}{$slideOptions.p_width}{else}250{/if},
						slideMargin: 10,
						minSlides: {if $slideOptions.min_item != ''}{$slideOptions.min_item}{else}1{/if},
						maxSlides: {if $slideOptions.max_item != ''}{$slideOptions.max_item}{else}8{/if},
						speed:  {if $slideOptions.speed_slide != ''}{$slideOptions.speed_slide}{else}500{/if},
						pause: {if $slideOptions.a_speed != ''}{$slideOptions.a_speed}{else}1000{/if},
						controls: {if $slideOptions.show_arrow != 0}{$slideOptions.show_arrow}{else}false{/if},
						pager: {if $slideOptions.show_ctr != 0}{$slideOptions.show_ctr}{else}false{/if},
				});
			</script> -->
	{/foreach}	
	
	 </div> <!-- .tab_container -->
</div>
{/if}
