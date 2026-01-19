codeunit 90105 "DeliveryPreferenceMgt."
{

    procedure CopyFromCustomer(CustomerNo: Code[20]; var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(CustomerNo) then begin

            SalesHeader.DeliveryTimePreference := Customer.DeliveryTimePreference;
            SalesHeader.DeliveryContactName := Customer.DeliveryContactName;
            SalesHeader.DeliveryContactPhone := Customer.DeliveryContactPhone;
            SalesHeader.DeliveryInstructions := Customer.DeliveryInstructions;
        end;
        if Not Customer.Get(CustomerNo) then
            Error('Customer is not found');
    end;

    procedure CompleteDeliveryInformation(SalesHeader: Record "Sales Header"): boolean
    var
        DeliveryTimePreferenceEnum: Enum "DeliveryTimePreference";
    begin
        if SalesHeader.DeliveryTimePreference = DeliveryTimePreferenceEnum::"2; Evening" then
            exit(false);
        if (SalesHeader.DeliveryInstructions <> '') or (SalesHeader.DeliveryContactPhone <> '') then
            exit(true);
        exit(false);
    end;

    procedure GetCompletionStatus(SalesHeader: Record "Sales Header"): Text
    begin
        if CompleteDeliveryInformation(SalesHeader) then
            Message('Delivery is ready for transport');
        exit('The Delivery is incomplete due to all the fields arent filled');
    end;

    procedure ShowNotification()
    var
        DeliveryNotification: Notification;
    begin
        DeliveryNotification.Message('Delivery details are complete.');
        DeliveryNotification.Scope(NotificationScope::LocalScope);
        DeliveryNotification.Send();
    end;

    procedure ShowWarningWithAction()
    var
        DeliveryNotification: Notification;
    begin
        DeliveryNotification.Message('Delivery info incomplete.');
        DeliveryNotification.Scope(NotificationScope::LocalScope);
        DeliveryNotification.AddAction('Go to Delivery Preferences', Codeunit::"DeliveryPreferenceMgt.", 'NavigateToDeliveryTab');
        DeliveryNotification.Send();
    end;

    procedure NavigateToDeliveryTab(TheNotification: Notification)
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.Get(SalesHeader."Document Type"::Order, TheNotification.GetData('No'))
    then
            Page.Run(Page::"Sales Order", SalesHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
    local procedure OnAfterValidateSellToCustomer(
        var Rec: Record "Sales Header";
        var xRec: Record "Sales Header";
        CurrFieldNo: Integer)
    begin
        CopyFromCustomer(Rec."Sell-to Customer No.", Rec);
    end;
}
