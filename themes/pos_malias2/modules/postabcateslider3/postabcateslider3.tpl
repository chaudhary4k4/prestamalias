<script type="text/javascript">

$(document).ready(function() {

	$(".tab3_category").hide();
	$(".tab3_category:first").show(); 
	$(".tab3_title").hide();
	$(".tab3_title:first").show();
	$("ul.tab3_cates li").click(function() {
		$("ul.tab3_cates li").removeClass("active");
		$(this).addClass("active");
		$(".tab3_category").hide();
		$(".tab3_title").hide();
		$(".tab3_category").removeClass("animate1 {$tab_effect}");
		var activeTab = $(this).attr("rel");
		var tab3_title = $(this).attr("data-title");				
		$("#"+activeTab) .addClass("animate1 {$tab_effect}");
		$("#"+activeTab).fadeIn(); 
		$("#"+tab3_title).fadeIn(); 
	});
});

</script>

<div class="tab-category-container-slider">
	<div class="container-tab">
		<div class="container-inner">
			<div class="tab-category">
				
				
				<div class="pos_tab">
				
					<div class ='cate_title'>
						{foreach from=$productCates item=productCate name=posTabCategory}
						 <div id="tabtitle2_{$productCate.id}" class="tab3_title"> 		
								<h2>
									<span>{$productCate.name}</span>
								</h2>
						</div>	
						{/foreach}
					</div>
					<ul class="tab3_cates"> 
					{$count=0}
					{foreach from=$productCates item=productCate name=posTabCategory}
							<li data-title="tabtitle2_{$productCate.id}" rel="tab3_{$productCate.id}" {if $count==0} class="active"  {/if} > {$productCate.name}</li>
							{$count= $count+1}
					{/foreach}	
					</ul>
				</div>	
			
				<div class="tab3_container"> 
				{foreach from=$productCates item=productCate name=posTabCategory}
		
					<div id="tab3_{$productCate.id}" class="tab3_category">
						<div class="row">
							<div class="productTabCategorySlider">
								{foreach from=$productCate.product item=product name=posTabCategory}
									
									<div class="cate_item">
										<div class="item-inner">
											<a class ="bigpic_{$product.id_product}_tabcategory product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}"><img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
												{if isset($product.new) && $product.specific_prices} 
													{if $product.specific_prices}<span class="sale">{l s='Sale' mod='postabcateslider3'}</span>{/if}
												{else}
												{if isset($product.new) && $product.new == 1}<span class="new">{l s='New' mod='postabcateslider3'}</span>{/if}
												{if $product.specific_prices}<span class="sale">{l s='Sale' mod='postabcateslider3'}</span>{/if}
												{/if}								
											</a>
											<div class="product-content">
												<h5 class="product-name"><a href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
												<div class="ratings">{hook h='displayProductListReviews' product=$product}</div>	
												{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
												<div  class="price-box">
													{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
														<span class="price product-price">
															{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
														</span>
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
														{hook h="displayProductPriceBlock" product=$product type="price"}
														{hook h="displayProductPriceBlock" product=$product type="unit_price"}
													{/if}
												</div>
												{/if}
												<div class="actions">
													
													<div class="acctions-inner">
														<div class="cart">
															{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
															{if ($product.allow_oosp || $product.quantity > 0)}
															{if isset($static_token)}
																<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow"  title="{l s='' mod='postabcategory'}" data-id-product="{$product.id_product|intval}">
																	<span><i class="fa fa-plus-square"></i> {l s='Add to cart' mod='postabcateslider3'}</span>
																	
																</a>
															{else}
															<a class="button ajax_add_to_cart_button btn btn-default"  href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='' mod='postabcategory'}" data-id-product="{$product.id_product|intval}">
																<span>{l s='Add to cart' mod='postabcateslider3'}</span>
															</a>
															   {/if}      
															{else}
															<span class="button ajax_add_to_cart_button btn btn-default disabled">
																<span>{l s='Add to cart' mod='postabcateslider3'}</span>
															</span>
															{/if}
															{/if}
														</div>
														<ul class="add-to-links">
															<li>
															{if isset($quick_view) && $quick_view}
																<a class="quick-view" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Quickview'  mod='postabcateslider3'}" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">

																</a>
															{/if}
															</li>
															<li>
																<a class="addToWishlist wishlistProd_{$product.id_product|intval}"  data-toggle="tooltip" data-placement="top" data-original-title="{l s='Wishlist' mod='postabcateslider3'}" href="#" data-wishlist="{$product.id_product|intval}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
																	<span>{l s="Wishlist" mod='postabcateslider3'}</span>
																	
																</a>
															</li>
															<li>
																
																{if isset($comparator_max_item) && $comparator_max_item}
																  <a class="add_to_compare" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Compare' mod='postabcateslider3'}"  href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"><i class="fa fa-retweet"></i>{l s='Compare' mod='postabcateslider3'}
																
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
							
					</div>
							
				{/foreach}	
				 </div> <!-- .tab_container -->
				<div class="boxprevnext">
					<a class="prev prevtabcate3"><i class="icon-angle-left"></i></a>
					<a class="next nexttabcate3"><i class="icon-angle-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript"> 
			$(document).ready(function() {
				var owl = $(".productTabCategorySlider");
				owl.owlCarousel({
				items :4,
				slideSpeed: 1000,
				pagination : false,
				itemsDesktop : [1200,4],
				itemsDesktopSmall : [1024,3],
				itemsTablet: [980,2],
				itemsMobile : [480,1]
				});
				$(".nexttabcate3").click(function(){
				owl.trigger('owl.next');
				})
				$(".prevtabcate3").click(function(){
				owl.trigger('owl.prev');
				})  
			});
		</script>
