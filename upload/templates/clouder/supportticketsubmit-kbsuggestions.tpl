{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


<h4>{$LANG.kbsuggestions}</h4>

<p>{$LANG.kbsuggestionsexplanation}</p>

<div class="kbsuggestions">
    {foreach from=$kbarticles item=kbarticle}
            <a href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">
                <span class="glyphicon glyphicon-file"></span>
                {$kbarticle.title}
				
				<p>{$kbarticle.article}...</p>
            </a>
    {/foreach}
</div>
