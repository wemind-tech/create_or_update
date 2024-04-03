# frozen_string_literal: true

RSpec.describe CreateOrUpdate do
  it "has a version number" do
    expect(CreateOrUpdate::VERSION).not_to be nil
  end

  describe '.create_or_update' do
    let(:unique_attribute) { 'unique_value' }
    let(:other_attribute) { 'other_value' }
    let(:new_other_attribute) { 'new_other_value' }

    context 'when no record matches the identifier' do
      it 'creates a new record with the given attributes' do
        expect {
          DummyModel.create_or_update(unique_attribute: unique_attribute, other_attribute: other_attribute)
        }.to change(DummyModel, :count).by(1)

        record = DummyModel.find_by(unique_attribute: unique_attribute)
        expect(record.other_attribute).to eq(other_attribute)
      end
    end

    context 'when a record matches the identifier' do
      before do
        DummyModel.create!(unique_attribute: unique_attribute, other_attribute: other_attribute)
      end

      it 'updates the existing record with new attributes' do
        expect {
          DummyModel.create_or_update(unique_attribute: unique_attribute, other_attribute: new_other_attribute)
        }.not_to change(DummyModel, :count)

        record = DummyModel.find_by(unique_attribute: unique_attribute)
        expect(record.other_attribute).to eq(new_other_attribute)
      end
    end
  end
end
