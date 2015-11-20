<div class="pos-logo-container">
	<div class="container">
		<div class="container-inner">
			<div class="pos-logo">
				<div class="pos-logo-title"><h2>{l s='Our Brands' mod='poslogo'}</h2></div>
				<div class="logo-slider">
					{foreach from=$logos item=logo name=posLogo}
						<div class="item-banklogo">
							<a href ="{$logo.link}">
								<img src ="{$logo.image}" alt ="{l s='Logo' mod='poslogo'}" />
							</a>
						</div>
					{/foreach}
				</div>
				<div class="boxprevnext">
					<a class="prev prevlogo"><i class="icon-angle-left"></i></a>
					<a class="next nextlogo"><i class="icon-angle-right"></i></a>
				</div>
					
			</div>
		</div>
	</div>	
	<!-- <script type="text/javascript">
		  $('.pos-logo .bxslider').bxSlider({
            auto: {if $slideOptions.auto != 1}{$slideOptions.auto}{else}1{/if},
            slideWidth:{if $slideOptions.width_item != ''}{$slideOptions.width_item}{else}250{/if},
			slideMargin: 5,
			minSlides: {if $slideOptions.min_item != ''}{$slideOptions.min_item}{else}3{/if},
			maxSlides: {if $slideOptions.max_item != ''}{$slideOptions.max_item}{else}8{/if},
			speed:  {if $slideOptions.speed_slide != ''}{$slideOptions.speed_slide}{else}5000{/if},
			pause: {if $slideOptions.a_speed != ''}{$slideOptions.a_speed}{else}1000{/if},
			controls: {if $slideOptions.show_nexback != 0}{$slideOptions.show_nexback}{else}false{/if},
            pager: {if $slideOptions.show_control != 0}{$slideOptions.show_control}{else}false{/if},
		});
	</script> -->
	<script type="text/javascript"> 
			$(document).ready(function() {
				var owl = $(".logo-slider");
				owl.owlCarousel({
				items :6,
				slideSpeed: 1000,
				pagination : false,
				itemsDesktop : [1200,6],
				itemsDesktopSmall : [980,5],
				itemsTablet: [767,4],
				itemsMobile : [480,2]
				});
				$(".nextlogo").click(function(){
				owl.trigger('owl.next');
				})
				$(".prevlogo").click(function(){
				owl.trigger('owl.prev');
				})  
			});
		</script>
		 
</div>