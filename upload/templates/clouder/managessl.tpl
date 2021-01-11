{include file="$template/includes/tablelist.tpl" tableName="SslList" startOrderCol="3" filterColumn="0" noSortColumns="4"}

<div class="alert alert-table-ssl-manage hidden"></div>

<div class="table-container clearfix">
    <table id="tableSslList" class="table table-list datatable table table-hover">
        <thead>
            <tr>
                <th data-class="expand">{lang key='ssldomain'}</th>
                <th data-hide="phone">{lang key='sslproduct'}</th>
                <th data-hide="phone,tablet">{lang key='sslorderdate'}</th>
                <th data-hide="phone,tablet">{lang key='sslrenewaldate'}</th>
                <th>{lang key='actions'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $sslProducts as $sslProduct}
                <tr>
                    {if $sslProduct->addonId && $sslProduct->addonId > 0}
                        <td>
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <label class="label label-info">{lang key='sslawaitingconfig'}</label>
                            {else}
                                {if $sslProduct->addon->service->domain}{$sslProduct->addon->service->domain}{else}-{/if}
                                {if $sslProduct->addon->nextDueDate instanceof Carbon}
                                    {if $sslProduct->addon->nextDueDate->isPast()}
                                        <label class="label label-default">{lang key='clientareaexpired'}</label>
                                    {elseif $sslProduct->addon->nextDueDate->diffInDays() < 60}
                                        <label class="label label-danger">{lang key='expiringsoon'}</label>
                                    {/if}
                                {/if}
                            {/if}
                        </td>
                        <td>
                            {$sslProduct->addon->productAddon->name}
                            <label class="label label-{if $sslProduct->validationType == 'DV'}default{elseif $sslProduct->validationType == 'OV'}warning{elseif $sslProduct->validationType == 'EV'}success{/if}">
                                {$sslProduct->validationType}
                            </label>
                        </td>
                        <td>{if $sslProduct->addon->registrationDate instanceof Carbon}<span class="hidden">{$sslProduct->addon->registrationDate->toDateString()}</span>{$sslProduct->addon->registrationDate->format({$smarty.const.CLIENT_DATE_FORMAT})}{/if}</td>
                        <td>{if $sslProduct->addon->nextDueDate instanceof Carbon}<span class="hidden">{$sslProduct->addon->nextDueDate->toDateString()}</span>{$sslProduct->addon->nextDueDate->format({$smarty.const.CLIENT_DATE_FORMAT})}{/if}</td>
                        <td>
                            {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                <button class="btn btn-default btn-sm btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-addonid="{$sslProduct->addonId}">{lang key='sslresendmail'}</button>
                            {/if}
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-default btn-sm">{lang key='sslconfigure'}</a>
                            {/if}
                            {if $sslProduct->addon->nextDueDate instanceof Carbon &&  $sslProduct->addon->nextDueDate->subDay()->isFuture()}
                                <form action="{$sslProduct->getUpgradeUrl()}" method="post">
                                    <input type="hidden" name="id" value="{$sslProduct->id}">
                                    <button type="submit" class="btn btn-default btn-sm"{if $sslProduct->validationType == 'EV'} disabled="disabled"{/if}>{lang key='upgrade'}</button>
                                </form>
                            {/if}
                        </td>
                    {else}
                        <td>
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <label class="label label-info">{lang key='sslawaitingconfig'}</label>
                            {else}
                                {if $sslProduct->service->domain}{$sslProduct->service->domain}{else}-{/if}
                                {if $sslProduct->service->nextDueDate instanceof Carbon && $sslProduct->service->nextDueDate->isPast()}
                                    <label class="label label-default">{lang key='clientareaexpired'}</label>
                                {elseif $sslProduct->service->nextDueDate instanceof Carbon && $sslProduct->service->nextDueDate->diffInDays() < 60}
                                    <label class="label label-danger">{lang key='expiringsoon'}</label>
                                {/if}
                            {/if}
                        </td>
                        <td>
                            {$sslProduct->service->product->name}
                            <label class="label label-{if $sslProduct->validationType == 'DV'}default{elseif $sslProduct->validationType == 'OV'}warning{elseif $sslProduct->validationType == 'EV'}success{/if}">
                                {$sslProduct->validationType}
                            </label>
                        </td>
                        <td>{if $sslProduct->service->registrationDate instanceof Carbon}<span class="hidden">{$sslProduct->service->registrationDate->toDateString()}</span>{$sslProduct->service->registrationDate->format({$smarty.const.CLIENT_DATE_FORMAT})}{/if}</td>
                        <td>{if $sslProduct->service->nextDueDate instanceof Carbon}<span class="hidden">{$sslProduct->service->nextDueDate->toDateString()}</span>{$sslProduct->service->nextDueDate->format({$smarty.const.CLIENT_DATE_FORMAT})}{/if}</td>
                        <td>
                            {if $sslProduct->status == $sslStatusAwaitingIssuance}
                                <button class="btn btn-default btn-sm btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-serviceid="{$sslProduct->serviceId}">{lang key='sslresendmail'}</button>
                            {/if}
                            {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                                <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-default btn-sm">{lang key='sslconfigure'}</a>
                            {/if}
                        </td>
                    {/if}

                </tr>
            {/foreach}
        </tbody>
    </table>
</div>

