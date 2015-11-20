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
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			{if isset($HOOK_FOOTER)}
				<!-- Footer -->
				<div class="footer-container">
					{hook h="posscroll"}
					<footer id="footer">
					
						<div class="BrandSlider">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-md-12 col-sm-12">
										{hook h="BrandSlider"}
									</div>
								</div>
							</div>
						</div>
						
						<div class="footer-bar">
							<div class="container">
								<div class="row">
									{hook h="blockFooter1"}
								</div>
							</div>	
						</div>
						
						<div class="footer-static-middle">
							<div class="container">
								
								<div class="row">
									{hook h="blockFooter2"}
								</div>
								
							</div>
						
						</div>
							<div class="footer-static-bottom">
							<div class="container">
								
								<div class="row">
									{hook h="blockFooter3"}
								</div>
								
							</div>
						
						</div>
					</footer>
				</div><!-- #footer -->
			{/if}
			
		</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
<script>
$(document).ready(function() {
	$(function () {
	   $("[data-toggle='tooltip']").tooltip();
	  });	
	});
</script>
	</body>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
</html>
