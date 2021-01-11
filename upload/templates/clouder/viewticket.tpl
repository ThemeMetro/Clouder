{*
 **********************************************************
 * Developed by: Team Theme Metro
 * Website: http://www.thememetro.com
 **********************************************************
*}


{if $invalidTicketId}

    {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid textcenter=true}

{else}

    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.supportticketclosedmsg textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

{/if}

{if !$invalidTicketId}

    <div class="panel panel-default panel-collapsable{if !$postingReply} panel-collapsed{/if} hidden-print">
        <div class="panel-heading d-flex align-items-center space-between" id="ticketReply">
            <h3 class="panel-title">
                <i class="fas fa-pencil-alt"></i> &nbsp; {$LANG.supportticketsreply}
            </h3>
            <div class="collapse-icon">
                <i class="fas fa-{if !$postingreply}plus{else}minus{/if}"></i>
            </div>
        </div>
        <div class="panel-body{if !$postingReply} panel-body-collapsed{/if}">

            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">

                <div class="row">
                    <div class="form-group col-sm-4">
                        <label for="inputName">{$LANG.supportticketsclientname}</label>
						<input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                    <div class="form-group col-sm-5">
                        <label for="inputEmail">{$LANG.supportticketsclientemail}</label>
						<input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputMessage">{$LANG.contactmessage}</label>
                    <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
                </div>

                <div class="row form-group">
                    <div class="col-sm-12">
                        <label for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
                    </div>
                    <div class="col-sm-9">
                        <input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
                        <div id="fileUploadsContainer"></div>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default btn-sm btn-block" onclick="extraTicketAttachment()">
                            <i class="fas fa-plus"></i> {$LANG.addmore}
                        </button>
                    </div>
                    <div class="col-xs-12 ticket-attachments-message text-muted">
                        {$LANG.supportticketsallowedextensions}: {$allowedfiletypes}
                    </div>
                </div>

                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
                    <input class="btn btn-default" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
                </div>

            </form>

        </div>
    </div>
	
    <div class="panel panel-info visible-print-block">
        <div class="panel-heading">
            <h3 class="panel-title">
                {$LANG.ticketinfo}
            </h3>
        </div>
        <div class="panel-body container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-6">
                    <b>{$LANG.supportticketsticketid}</b><br />{$tid}
                </div>
                <div class="col-md-4 col-xs-6">
                    <b>{$LANG.supportticketsticketsubject}</b><br />{$subject}
                </div>
                <div class="col-md-2 col-xs-6">
                    <b>{$LANG.supportticketspriority}</b><br />{$urgency}
                </div>
                <div class="col-md-4 col-xs-6">
                    <b>{$LANG.supportticketsdepartment}</b><br />{$department}
                </div>
            </div>
        </div>
    </div>
	
    {foreach $descreplies as $reply}
        <div class="ticket-reply markdown-content{if $reply.admin} staff{/if}">
            <div class="date">
                {$reply.date}
            </div>
            <div class="user">
                <i class="fas fa-user"></i>
                <span class="name">
                    {$reply.requestor.name}
                    <span class="label requestor-type-{$reply.requestor.type_normalised}">
                        {if $reply.requestor.type_normalised eq 'operator'}
                            {lang key='support.requestor.operator'}
                        {elseif $reply.requestor.type_normalised eq 'owner'}
                            {lang key='support.requestor.owner'}
                        {elseif $reply.requestor.type_normalised eq 'authorizeduser'}
                            {lang key='support.requestor.authorizeduser'}
                        {elseif $reply.requestor.type_normalised eq 'externaluser'}
                            {lang key='support.requestor.externaluser'}
                        {elseif $reply.requestor.type_normalised eq 'subaccount'}
                            {lang key='support.requestor.subaccount'}
                        {elseif $reply.requestor.type_normalised eq 'guest'}
                            {lang key='support.requestor.guest'}
                        {/if}
                    </span>
                </span>
                <span class="type">
                    {if $reply.admin}
                        {$LANG.supportticketsstaff}
                    {else}
                        {$reply.requestor.email}
                    {/if}
                </span>
            </div>
            <div class="message">
                {$reply.message}
                {if $reply.id && $reply.admin && $ratingenabled}
                    <div class="clearfix">
                        {if $reply.rating}
                            <div class="rating-done">
                                {for $rating=1 to 5}
                                    <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
                                {/for}
                                <div class="rated">{$LANG.ticketreatinggiven}</div>
                            </div>
                        {else}
                            <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
                                <span class="star" rate="5"></span>
                                <span class="star" rate="4"></span>
                                <span class="star" rate="3"></span>
                                <span class="star" rate="2"></span>
                                <span class="star" rate="1"></span>
                            </div>
                        {/if}
                    </div>
                {/if}
            </div>
            {if $reply.attachments}
                <div class="attachments">
                    <strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
					{if $reply.attachments_removed}({lang key='support.attachmentsRemoved'}){/if}
                    <ul>
                        {foreach $reply.attachments as $num => $attachment}
                            {if $reply.attachments_removed}
                                <li>
                                    <i class="far fa-file-minus"></i>
                                    {$attachment}
                                </li>
                            {else}
                                <li>
                                    <i class="far fa-file"></i>
                                    <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">
                                        {$attachment}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    {/foreach}

{/if}
