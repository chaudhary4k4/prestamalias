{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if count($categoryProducts) > 0 && $categoryProducts !== false}
<section class="page-product-box blockproductscategory">
	<h3 class="productscategory_h3 page-product-heading"><!-- {$categoryProducts|@count} --> {l s='RELATED PRODUCTS' mod='productscategory'}</h3>
	<div id="productscategory_list" class="clearfix">
		<div class="row">
			<div id="product_category">
			{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
				<div class="product-box">
					<div class="item-iii">
						<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" class="lnk_img product-image" title="{$categoryProduct.name|htmlspecialchars}"><img src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$categoryProduct.name|htmlspecialchars}" /></a>
						<div class="product-content">
							<h5 itemprop="name" class="product-name">
								<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)|escape:'html':'UTF-8'}" title="{$categoryProduct.name|htmlspecialchars}">{$categoryProduct.name|truncate:20:'...'|escape:'html':'UTF-8'}</a>
							</h5>
						
							<div class="ratings">{hook h='displayProductListReviews' product=$categoryProduct}</div>
							{if $ProdDisplayPrice && $categoryProduct.show_price == 1 && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
								<p class="price_display price-box">
								{if isset($categoryProduct.specific_prices) && $categoryProduct.specific_prices
								&& ($categoryProduct.displayed_price|number_format:2 !== $categoryProduct.price_without_reduction|number_format:2)}

									<span class="price special-price">{convertPrice price=$categoryProduct.displayed_price}</span>
									{if $categoryProduct.specific_prices.reduction && $categoryProduct.specific_prices.reduction_type == 'percentage'}
										<span class="price-percent-reduction small">-{$categoryProduct.specific_prices.reduction * 100}%</span>
									{/if}
									<span class="old-price">{displayWtPrice p=$categoryProduct.price_without_reduction}</span>

								{else}
									<span class="price">{convertPrice price=$categoryProduct.displayed_price}</span>
								{/if}
								</p>
							{else}
							<br />
							{/if}
							<div class="clearfix">
								{if !$PS_CATALOG_MODE && ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
									<div class="no-print">
										<div class="actions">
											<div class="acctions-inner">
												<div class="cart">
													<a class="exclusive button ajax_add_to_cart_button"  href="{$link->getPageLink('cart', true, NULL, 'qty=1&amp;id_product={$categoryProduct.id_product|intval}&amp;token={$static_token}&amp;add')|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product|intval}" title="{l s='Add to cart'}">
														<span>{l s='Add to cart' mod='productscategory'}</span>
													
													</a>
												</div>
												<ul class="add-to-links">
													<li>
													{if isset($quick_view) && $quick_view}
														<a class="quick-view" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Quickview'  mod='productscategory'}" href="{$categoryProduct.link|escape:'html':'UTF-8'}" rel="{$categoryProduct.link|escape:'html':'UTF-8'}">

														</a>
													{/if}
													</li>
													<li>
														<a class="addToWishlist wishlistProd_{$categoryProduct.id_product|intval}" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Wishlist' mod='productscategory'}"  href="#" data-wishlist="{$categoryProduct.id_product|intval}" onclick="WishlistCart('wishlist_block_list', 'add', '{$categoryProduct.id_product|intval}', false, 1); return false;">
															<span>{l s="Wishlist" mod='productscategory'}</span>
													
														</a>
													</li>
													<li>
														
														{if isset($comparator_max_item) && $comparator_max_item}
														  <a class="add_to_compare" data-toggle="tooltip" data-placement="top" data-original-title="{l s='Compare' mod='productscategory'}"   href="{$categoryProduct.link|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product}"><i class="fa fa-retweet"></i>{l s='Compare' mod='productscategory'}
													
														  </a>
														 {/if}
									
													</li>
												</ul>
											</div>	
										</div>
									</div>
								{/if}
							</div>
						</div>	
					</div>
				</div>
			{/foreach}
			
			</div>
		</div>	
		<div class="boxprevnext">
			<a class="prev prev-product"><i class="icon-angle-left"></i></a>
			<a class="next next-product"><i class="icon-angle-right"></i></a>
		</div>
	</div>
</section>
{/if}
<script type="text/javascript"> 
    $(document).ready(function() {
		var owl = $("#product_category");
		owl.owlCarousel({
		items : 4,
		 pagination :false,
		slideSpeed: 1000,
		itemsDesktop : [1200,4],
		itemsDesktopSmall : [1024,3], 
		itemsTablet: [991,2], 
		itemsMobile : [480,1],
		});
		 
		// Custom Navigation Events
		$(".next-product").click(function(){
		owl.trigger('owl.next');
		})
		$(".prev-product").click(function(){
		owl.trigger('owl.prev');
		})     
    });

</script>
