using Microsoft.Sales.Customer;
tableextension 90010 SalesOrderExt3Lines extends "Sales Line"
{
    fields
    {
        field(90010; FilterPremiumProduct; Text[20])
        {

            Caption = 'Filter Prices';
            Dataclassification = ToBeClassified;
            Trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.SetFilter(Amount, '>500');
                Message('this is the right order this is a premimum profuct')
            end;
        }

    }
}
