table 60149 Peralatan
{
    Caption = 'Peralatan';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No Aset"; Code[20])
        {
            Caption = 'Nomor Aset';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Nama Barang"; Text[150])
        {
            Caption = 'Nama Barang';
            DataClassification = CustomerContent;
        }
        field(3; "Tanggal Pembelian"; Date)
        {
            Caption = 'Tanggal Pembelian';
            DataClassification = CustomerContent;
        }
        field(4; "Kondisi"; Option)
        {
            Caption = 'Kondisi';
            OptionMembers = "Baik","Rusak Ringan","Rusak Berat";
            DataClassification = CustomerContent;
        }
        field(5; "Harga Beli"; Decimal)
        {
            Caption = 'Harga Beli';
            DataClassification = CustomerContent;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Harga Beli" < 0 then
                    Error('Harga Beli tidak boleh negatif.');
            end;
        }
    }

    keys
    {
        key(PK; "No Aset")
        {
            Clustered = true;
        }
    }
}