codeunit 90105 "DeliveryPreferenceMgt."
{
    ubtype = EventSubsciber;
    procedure CopyFromCustomer(CustomerNo: Code[20]; Var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(CustomerNo) then
            Error('customer is not found');
        SalesHeader.DeliveryTimePreference := Customer.DeliveryTimePreference;
        SalesHeader.DeliveryContactName := Customer.DeliveryContactName;
        SalesHeader.DeliveryContactPhone := Customer.DeliveryContactPhone;
        SalesHeader.DeliveryInstructions := Customer.DeliveryInstructions;
    end;

    procedure AutoFillingDelivery(CustomerNo: code[20]; var SalesHeader: Record "Sales Header")
    begin
        CopyFromCustomer(CustomerNo, SalesHeader);
    end;








}
