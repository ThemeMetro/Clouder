{if $message = get_flash_message()}
    <div class="alert alert-{if $message.type == "error"}danger{elseif $message.type == 'success'}success{elseif $message.type == 'warning'}warning{else}info{/if}">
        {$message.text}
    </div>
{/if}
