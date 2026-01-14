codeunit 50106 "DeliveryPreferenceMgt."
{
    procedure CopyFromCustomer(CustomerNo: Code[20]; Var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.Get(CustomerNo) then begin
            SalesHeader."DeliveryTimePreference" := Customer.DeliveryTimePreference;
        end;

    end;

}
