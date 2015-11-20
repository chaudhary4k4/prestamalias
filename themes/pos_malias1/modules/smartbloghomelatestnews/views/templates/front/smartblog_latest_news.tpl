<div class="block-smartblog">
    <h2 class='sdstitle_block'><a href="{smartblog::GetSmartBlogLink('smartblog')}">{l s='RECENT POSTS' mod='smartbloghomelatestnews'}</a></h2>
	<div class="row">
		<div class="sdsblog-box-content">
			{if isset($view_data) AND !empty($view_data)}
				{assign var='i' value=1}
				{foreach from=$view_data item=post}
				   
						{assign var="options" value=null}
						{$options.id_post = $post.id}
						{$options.slug = $post.link_rewrite}
						<div class="sds_blog_post" >
							<span class="news_module_image_holder">
								 <a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><img alt="{$post.title}" class="feat_img_small" src="{$modules_dir}smartblog/images/{$post.post_img}-home-default.jpg"></a>
							</span>
						
							<h4 class="sds_post_title"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title}</a></h4>
							<p>
								{$post.short_description|escape:'htmlall':'UTF-8'}
							</p>
							<a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"  class="r_more">{l s='Read More' mod='smartbloghomelatestnews'}</a>
							<span class="date-smart">{$post.date_added}</span>
						</div>
					
					{$i=$i+1}
				{/foreach}
			{/if}
		</div>
	</div>	 
</div>
<script>


    $(document).ready(function() {
     
    var owl = $(".sdsblog-box-content");
     
    owl.owlCarousel({
	autoPlay : false,
	 pagination : true,
    items : 1,
	slideSpeed: 1000,
	itemsDesktop : [1199,1],
	itemsDesktopSmall : [980,1],
	itemsTablet: [640,2],
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