codeunit 90105 "DeliveryPreferenceMgt."
{
    procedure CopyFromCustomer(CustomerNo: Code[20]; var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if not Customer.Get(CustomerNo) then begin
            Error('Customer is not found');

            SalesHeader.DeliveryTimePreference := Customer.DeliveryTimePreference;
            SalesHeader.DeliveryContactName := Customer.DeliveryContactName;
            SalesHeader.DeliveryContactPhone := Customer.DeliveryContactPhone;
            SalesHeader.DeliveryInstructions := Customer.DeliveryInstructions;
        end;
    end;

    procedure CompleteDeliveryInformation(SalesHeader: Record "Sales Header"): boolean
    var
        DeliveryTimePreferenceEnum: Enum "DeliveryTimePreference";
    begin
        if SalesHeader.DeliveryTimePreference = DeliveryTimePreferenceEnum::"nothing" then
            exit(false);
        if (SalesHeader.DeliveryInstructions <> '') or (SalesHeader.DeliveryContactPhone <> '') then
            exit(true);

        exit(false);
    end;

    procedure GetCompletionStatus(SalesHeader: Record "Sales Header"): Text
    begin
        CompleteDeliveryInformation(SalesHeader);
        Message('Delivery is ready for transport');

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
