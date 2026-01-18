tableextension 90106 SalesHeaderDeliveryExt extends "Sales Header"
{
    fields
    {
        field(90100; DeliveryContactName; Text[50])
        {
            Caption = 'Delivery Contact Name';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Autofill: Codeunit "DeliveryPreferenceMgt.";
            begin
                Autofill.CopyFromCustomer("Sell-to Customer No.", Rec);
            end;
        }
        field(90101; DeliveryInstructions; Text[250])
        {
            Caption = 'Delivery instructions';
            DataClassification = CustomerContent;
            trigger Onvalidate()
            var
                Autofill: Codeunit "DeliveryPreferenceMgt.";
            begin
                Autofill.CopyFromCustomer("Sell-to Customer No.", Rec);
            end;
        }
        field(90102; DeliveryContactPhone; Text[20])
        {
            Caption = 'Delivery Contact Phone';
            DataClassification = CustomerContent;
            trigger Onvalidate()
            var
                Autofill: Codeunit "DeliveryPreferenceMgt.";
            begin
                Autofill.CopyFromCustomer("Sell-to Customer No.", Rec);
            end;

        }
        field(90103; DeliveryTimePreference; Enum DeliveryTimePreference)
        {
            caption = 'Delivery Time Preference';
            DataClassification = CustomerContent;
            trigger Onvalidate()
            var
                Autofill: Codeunit "DeliveryPreferenceMgt.";
            begin
                Autofill.CopyFromCustomer("Sell-to Customer No.", Rec);
            end;
        }
    }
}
