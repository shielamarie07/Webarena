{if #BANNER_MANAGEMENT#}

	{if !empty($randomBanner)}
		<img src="{$bannerImageURL}{$randomBanner.image}" alt="" width="{$randomBanner.width}" height="{$randomBanner.height}" />

	{elseif !empty($rotateBanners)}

		<script type="text/javascript" src="/sys_js/fadeslideshow.js">
			/***********************************************
			* Ultimate Fade In Slideshow v2.0- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
			* This notice MUST stay intact for legal use
			* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
			***********************************************/
		</script>

		<script type="text/javascript">
			var fadeimages=new Array()

			{foreach from=$rotateBanners item=banner name=banRotate}
				{assign var=url value=""}

				{if !empty($banner.internal_url)}
					{assign var=url value=$banner.internal_url}
				{elseif !empty($banner.external_url)}
					{assign var=url value=$banner.external_url}
				{/if}

				fadeimages[{$smarty.foreach.banRotate.iteration-1}]=["{$bannerImageURL}{$banner.image}", "{$url}", "",""]
			{/foreach}
			{literal}
			var mygallery=new fadeSlideShow({
				wrapperid: "bannershow", //ID of blank DIV on page to house Slideshow
				dimensions: [{/literal}{$bannerMaxWidth}, {$bannerMaxHeight}{literal}], //width/height of gallery in pixels. Should reflect dimensions of largest image
				imagearray: fadeimages,
				displaymode: {type:'auto', pause:2500, cycles:0, wraparound:false},
				persist: false, //remember last viewed slide and recall within same session?
				fadeduration: 500, //transition duration (milliseconds)
				descreveal: "ondemand",
				togglerid: "bannershowtoggler",
				instancevar: "mygallery"
			})
		{/literal}
		</script>
	{/if}
	
	<div id="bannershow"></div>
	<div id="bannershowtoggler">
		<a href="#" class="prev"></a><span class="status"></span><a href="#" class="next"></a>
	</div>
{/if}
