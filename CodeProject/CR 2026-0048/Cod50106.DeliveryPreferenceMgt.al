codeunit 90105 "DeliveryPreferenceMgt."
{
    procedure CopyFromCustomer(CustomerNo: Code[20]; var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if not Customer.Get(CustomerNo) then
            Error('Customer is not found');

        SalesHeader.DeliveryTimePreference := Customer.DeliveryTimePreference;
        SalesHeader.DeliveryContactName := Customer.DeliveryContactName;
        SalesHeader.DeliveryContactPhone := Customer.DeliveryContactPhone;
        SalesHeader.DeliveryInstructions := Customer.DeliveryInstructions;
    end;

    procedure AutoFillingDelivery(CustomerNo: Code[20]; var SalesHeader: Record "Sales Header")
    begin
        CopyFromCustomer(CustomerNo, SalesHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
    local procedure OnAfterValidateSellToCustomer(
        var Rec: Record "Sales Header";
        var xRec: Record "Sales Header";
        CurrFieldNo: Integer)
    begin
        if Rec."Sell-to Customer No." <> '' then
            CopyFromCustomer(Rec."Sell-to Customer No.", Rec);
    end;
}
