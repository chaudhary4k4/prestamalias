<script type="text/javascript">

$(document).ready(function() {

	$(".tab_category").hide();
	$(".tab_category:first").show(); 

	$("ul.tab_cates li").click(function() {
		$("ul.tab_cates li").removeClass("active");
		$(this).addClass("active");
		$(".tab_category").hide();
		$(".tab_category").removeClass("animate1 {$tab_effect}");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 {$tab_effect}");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>

<div class="tab-category-container-slider">
	<div class="container">
		<div class="container-inner">
			<div class="tab-category">
				
					<div class ='cate_title'>
						<h2>{l s='New Arrivals' mod='postabcategory'}</h2>
					</div>
				
		<!-- 		<p class="des-tab">{l s='Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua' mod='postabcategory'}</p> -->
				<ul class="tab_cates"> 
				{$count=0}
				{foreach from=$productCates item=productCate name=posTabCategory}
						<li rel="tab_{$productCate.id}" {if $count==0} class="active"  {/if} > {$productCate.name}</li>
						{$count= $count+1}
				{/foreach}	
				</ul>
			
				<div class="tab_container"> 
				{foreach from=$productCates item=productCate name=posTabCategory}
		
					 <div id="tab_{$productCate.id}" class="tab_category"> 
								<div class="productTabCategorySlider">
									{foreach from=$productCate.product item=product name=posTabCategory}
										
										<div class="cate_item">
											<div class="item-inner">
												<a class ="bigpic_{$product.id_product}_tabcategory product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />
													{if isset($product.new) && $product.specific_prices} 
														{if $product.specific_prices}<span class="sale">{l s='Sale'}</span>{/if}
													{else}
													{if isset($product.new) && $product.new == 1}<span class="new">{l s='New'}</span>{/if}
													{if $product.specific_prices}<span class="sale">{l s='Sale'}</span>{/if}
													{/if}								
												</a>
												<h5 class="product-name"><a href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
												<div class="ratings">{hook h='displayProductListReviews' product=$product}</div>	
												<div class="price-box">
													{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
													
														{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
															<span class="old-price product-price">
																{displayWtPrice p=$product.price_without_reduction}
															</span>
														{/if}
															<span itemprop="price" class="price product-price">
															{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
														</span>
													{/if}
												</div>
												
												<div class="actions">
													{if isset($quick_view) && $quick_view}
														<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
															<span class="tooltip">Quick view</span>
														</a>
													{/if}
													<div class="acctions-inner">
														<div class="cart">
															{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
															{if ($product.allow_oosp || $product.quantity > 0)}
															{if isset($static_token)}
																<a class="button ajax_add_to_cart_button btn btn-default"  href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posfeatureproducts'}" data-id-product="{$product.id_product|intval}">
																	<span><i class="fa fa-plus-square"></i> {l s='Add to cart' mod='posfeatureproducts'}</span>
																	
																</a>
															{else}
															<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='posfeatureproducts'}" data-id-product="{$product.id_product|intval}">
																<span>{l s='Add to cart' mod='posfeatureproducts'}</span>
															</a>
															   {/if}      
															{else}
															<span class="button ajax_add_to_cart_button btn btn-default disabled">
																<span>{l s='Add to cart' mod='posfeatureproducts'}</span>
															</span>
															{/if}
															{/if}
														</div>
														<ul class="add-to-links">
															<li>
																<a class="addToWishlist wishlistProd_{$product.id_product|intval}"  data-original-title="Add to Cart" rel="tooltip" href="#" data-wishlist="{$product.id_product|intval}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
																	<span>{l s="Wishlist" mod='blockwishlist'}</span>
																	
																</a>
															</li>
															<li>
																
																{if isset($comparator_max_item) && $comparator_max_item}
																  <a class="add_to_compare"  href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"><i class="fa fa-retweet"></i>{l s='Compare'}
																
																  </a>
																 {/if}
											
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									{/foreach}
								</div>
							
							</div>
							
				{/foreach}	
				 </div> <!-- .tab_container -->
				<div class="boxprevnext">
					<a class="prev prevtabcate"><i class="icon-angle-left"></i></a>
					<a class="next nexttabcate"><i class="icon-angle-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript"> 
			$(document).ready(function() {
				var owl = $(".productTabCategorySlider");
				owl.owlCarousel({
				items :5,
				slideSpeed: 1000,
				itemsDesktop : [1200,5],
				itemsDesktopSmall : [980,4],
				itemsTablet: [767,2],
				itemsMobile : [480,1]
				});
				$(".nexttabcate").click(function(){
				owl.trigger('owl.next');
				})
				$(".prevtabcate").click(function(){
				owl.trigger('owl.prev');
				})  
			});
		</script>
