	{if isset($products) AND $products}
<div id="special_products_home" class="products_block">
	<div class="special_products_title">
		<h4 class="title_block">
			<a href="{$link->getPageLink('prices-drop')|escape:'html'}" title="{l s='product products' mod='posspecialsproducts'}">{l s='Special Products' mod='posspecialsproducts'}</a>
		</h4>
	</div>
		<div class="block_content row">
			{assign var='liHeight' value=260}
			{assign var='nbItemsPerLine' value=3}
			{assign var='nbLi' value=$products|@count}
			{assign var='nbLines' value=ceil($nbLi/$nbItemsPerLine)}
			{assign var='ulHeight' value=$nbLines*$liHeight}
			{assign var='nub' value=$row*$item}
			
			
			<div id="pos-special-products" class="product_list">
			{foreach from=$products item=product name=myLoop}
			{if $smarty.foreach.myLoop.index % {$row} == 0 || $smarty.foreach.myLoop.first }
				<div class="item">
			{/if}
			<div class="item_ii">
						<div class="products">
							<div class="products-inner">
								<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}" class="content_img clearfix">
									<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}"
										class="img-responsive" alt="{$product.legend|escape:'html':'UTF-8'}"/>

								</a>
								{if isset($quick_view) && $quick_view}
									<div class="quick_view">
										<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
											<i class="fa fa-eye"></i><span>{l s='Quick view'}</span>
										</a>
									</div>
								{/if}
							</div>
							<div class="actions">
								<div class="cart">
									{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
										{if ($product.allow_oosp || $product.quantity > 0)}
											{if isset($static_token)}
												<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
													<i class="fa fa-plus-circle"></i>{l s='Add to cart'}
												</a>
											{else}
												<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product="{$product.id_product|intval}">
													<i class="fa fa-plus-circle"></i>{l s='Add to cart'}
												</a>
											{/if}						
										{else}
											<span class="button ajax_add_to_cart_button btn btn-default disabled">
												<i class="fa fa-plus-circle"></i>{l s='Add to cart'}
											</span>
										{/if}
									{/if}
								</div>
								<ul class="add-to-links">					
									<li>
										{hook h='displayProductListFunctionalButtons' product=$product}
									</li>
									<li>
										{if isset($comparator_max_item) && $comparator_max_item}
											<a class="add_to_compare" title="Compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}"><i class="fa fa-retweet"></i>{l s='Add to Compare'}</a>
										{/if}
									</li>
								</ul>
							</div>
						</div>
							{if !$PS_CATALOG_MODE}
									<h5 class="s_title_block">
										<a href="{$product.link|escape:'html'}" title="{$product.legend|escape:'html':'UTF-8'}">
										{$product.name|strip_tags:'UTF-8'|escape:'html':'UTF-8'}<br/>
										</a>
									</h5>
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
									{if isset($product.specific_prices)  && $product.specific_prices.to|date_format:"%Y" !=0 }
									   <div class="countdown" >
										{hook h='timecountdown' product=$product } 
										<span  id="future_date_{$product.id_category_default}_{$product.id_product}" 
										  class="id_countdown"></span>
										<div class="clearfix"></div>
									   </div>
									 {/if}
							{/if}
				</div>
			{if $smarty.foreach.myLoop.iteration % {$row} == 0 || $smarty.foreach.myLoop.last  }
				</div>
			{/if}
			{/foreach}
			</div>
			{$nb}
			<div class="specialhomeprevnext">
					<a class="prev prevspecial">prev</a>
					<a class="next nextspecial">next</a>
			</div>
		</div>
</div>
<script>


    $(document).ready(function() {
     
    var owl = $("#pos-special-products");
     
    owl.owlCarousel({
	autoPlay : false,
    items : 4,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [980,2],
		itemsTablet: [599,1],
		itemsMobile : [480,1]
    });
	// Custom Navigation Events
		$(".nextspecial").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevspecial").click(function(){
		owl.trigger('owl.prev');
		})     
    });
</script>
	{/if}