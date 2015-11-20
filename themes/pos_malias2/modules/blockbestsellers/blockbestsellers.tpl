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

<!-- MODULE Block best sellers -->
<div id="best-sellers_block_right" class=" products_block">
	<h4 class="title_block">
    	<a href="{$link->getPageLink('best-sales')|escape:'html'}" title="{l s='View a top sellers products' mod='blockbestsellers'}">{l s='Top sellers' mod='blockbestsellers'}</a>
    </h4>
	<div class="block_content_bestsellers">
	{if $best_sellers && $best_sellers|@count > 0}
		<div class=" Topsellers block_content products-block">
		{foreach from=$best_sellers item=product name=myLoop}
			{if $smarty.foreach.myLoop.index % 3 == 0 || $smarty.foreach.myLoop.first }
			<div class="clearfix bestsellerproductslider">
			{/if}
				<div class="seller-item">
					<div class="sellers-img">
						<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}" class="products-block-image content_img clearfix">
							<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.legend|escape:'html':'UTF-8'}" />
						</a>
					</div>
					<div class="product-contents">
						<h5 class="product-name">
							<a  href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
								{$product.name|strip_tags:'UTF-8'|escape:'html':'UTF-8'}
							</a>
						</h5>
						
						<p class="product-description">{$product.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</p>
						{if !$PS_CATALOG_MODE}
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
						{/if}
						<div class="ratings">{hook h='displayProductListReviews' product=$product}</div>
					</div>
				</div>
			{if $smarty.foreach.myLoop.iteration % 3 == 0 || $smarty.foreach.myLoop.last  }
			</div>
			{/if}
		{/foreach}
		</div>
		 <div class="sellersprevnext">
			<a class="prev prevsellers"><i class="icon-angle-left"></i></a>
			<a class="next nextsellers"><i class="icon-angle-right"></i></a>
		</div> 
	{else}
		<p>{l s='No best sellers at this time' mod='blockbestsellers'}</p>
	{/if}
	</div>
</div>
	<script type="text/javascript"> 
			$(document).ready(function() {
				var owl = $(".Topsellers");
				owl.owlCarousel({
				items :1,
				slideSpeed: 1000,
				 pagination :false,
				itemsDesktop : [1200,1],
				itemsDesktopSmall : [1024,1],
				itemsTablet: [768,1],
				itemsMobile : [480,1]
				});
				$(".nextsellers").click(function(){
				owl.trigger('owl.next');
				})
				$(".prevsellers").click(function(){
				owl.trigger('owl.prev');
				})  
			});
		</script>
<!-- /MODULE Block best sellers -->