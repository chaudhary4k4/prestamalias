{*
* 2007-2014 PrestaShop
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
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- pos search module TOP -->
<div id="pos_search_top" class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
    <form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox" class="form-inline" role="form">
			<label for="pos_query_top"><!-- image on background --></label>
            <input type="hidden" name="controller" value="search" />
            <input type="hidden" name="orderby" value="position" />
            <input type="hidden" name="orderway" value="desc" />

                {if $cate_on ==1}
                    <div class="pos_search form-group">
                  
                    <select name="poscats" class="selectpicker">
						<option value="">{l s='all Categories'}</option>
                        {$categories_option}
                    </select>
                    </div>
                {/if}

			<input class="search_query form-control" type="text" id="pos_query_top" name="search_query" placeholder="{l s='Search entire store here' mod='possearchcategories'}" value="{$search_query|escape:'html':'UTF-8'|stripslashes}" />
			<button type="submit" name="submit_search" value="{l s='Search' mod='possearchcategories'}" class="btn btn-default search_submit"><i class="icon-search"></i></button>
    </form>
</div>
{include file="$self/possearch-instantsearch.tpl"}

<script type="text/javascript">
    $(window).on('load', function () {

        $('.selectpicker').selectpicker({
            'selectedText': 'cat'
        });

        // $('.selectpicker').selectpicker('hide');
    });
</script>
<!-- /pos search module TOP -->
